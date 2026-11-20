import { ChildProcess, execFileSync, spawn } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';
import { APPS_DIR } from './paths';

const START_TIMEOUT_MS = 60_000;
const STOP_TIMEOUT_MS = 5_000;

// Runs inside the app's R process. R picks the port; shiny calls launch.browser only after the server
// is bound (its "Listening on" line is printed before binding), so E2E_READY means the app accepts
// connections. If the bind fails, R exits and start() fails with the R output.
const R_LAUNCHER = `
options(warn = 1) # print warnings immediately; runApp() never returns to top level
watch_parent <- function() {
  # Quit if the test worker died without stopping us (e.g. kill -9), so no orphans.
  if (!isTRUE(tools::pskill(as.integer(Sys.getenv("E2E_PARENT_PID")), 0L))) quit(save = "no")
  later::later(watch_parent, 1)
}
if (.Platform$OS.type == "unix") watch_parent()
# Put the library built by global setup first. Its path comes as a command-line argument and is set
# here, not via R_LIBS or another environment variable, because a user's .Renviron can override those.
# Then make sure every package in it really resolves from that library.
lib <- commandArgs(trailingOnly = TRUE)[1]
if (is.na(lib) || length(list.files(lib)) == 0) stop("The e2e library is missing or empty: ", lib)
.libPaths(c(lib, .libPaths()))
for (pkg in list.files(lib)) {
  found <- normalizePath(dirname(find.package(pkg)))
  if (found != normalizePath(lib)) stop("Package ", pkg, " resolves from ", found, ", not from the e2e library ", lib)
}
app <- Sys.getenv("E2E_APP")
if (!dir.exists(app)) app <- shiny::shinyAppFile(app)
# Ports from 10081 up: browsers refuse some lower ports (e.g. 1719, 1720, 1723, 5060, 10080) that
# httpuv's list of unsafe ports does not include, and the page would fail with ERR_UNSAFE_PORT.
shiny::runApp(app, host = "127.0.0.1", port = httpuv::randomPort(min = 10081L),
              launch.browser = function(url) message("E2E_READY ", url))
`;

/** One Shiny app running in its own R process. */
export class ShinyAppProcess {
  private readonly lines: string[] = [];

  private constructor(
    readonly appPath: string,
    private readonly proc: ChildProcess,
    public url = '',
  ) {}

  /** Start the app at `app`: a name under tests/e2e/apps, or an absolute path to an app dir or .R file. */
  static async start(app: string): Promise<ShinyAppProcess> {
    const appPath = path.isAbsolute(app) ? app : path.join(APPS_DIR, app);
    if (!fs.existsSync(appPath)) throw new Error(`Shiny app not found: ${appPath}`);
    const cwd = fs.statSync(appPath).isDirectory() ? appPath : path.dirname(appPath);

    const lib = process.env.E2E_LIB;
    if (!lib) throw new Error('E2E_LIB is not set: global setup did not run (run the tests with Playwright).');

    const proc = spawn('Rscript', ['-e', R_LAUNCHER, lib], {
      cwd,
      // Own process group on POSIX, so stop() can kill the whole tree.
      detached: process.platform !== 'win32',
      stdio: ['ignore', 'pipe', 'pipe'],
      env: {
        ...process.env,
        E2E_APP: appPath,
        E2E_PARENT_PID: String(process.pid),
      },
    });
    const instance = new ShinyAppProcess(appPath, proc);
    await instance.waitUntilListening();
    return instance;
  }

  private waitUntilListening(): Promise<void> {
    return new Promise((resolve, reject) => {
      const timer = setTimeout(
        () => fail(`did not start within ${START_TIMEOUT_MS / 1000}s`),
        START_TIMEOUT_MS,
      );
      const fail = (reason: string) => {
        clearTimeout(timer);
        void this.stop();
        reject(new Error(`Shiny app ${this.appPath} ${reason}. R output:\n${this.logs()}`));
      };
      const handleLine = (line: string, stream: 'out' | 'err') => {
        if (!line) return;
        this.lines.push(stream === 'err' ? `[stderr] ${line}` : line);
        const match = /^E2E_READY (http:\/\/\S+)/.exec(line);
        if (match && !this.url) {
          this.url = match[1];
          clearTimeout(timer);
          resolve();
        }
      };
      const read = (stream: 'out' | 'err') => {
        const source = stream === 'out' ? this.proc.stdout! : this.proc.stderr!;
        let partial = ''; // a chunk can end mid-line; keep the rest until its newline arrives
        source.on('data', (chunk: Buffer) => {
          const parts = (partial + chunk.toString()).split(/\r?\n/);
          partial = parts.pop()!;
          for (const line of parts) handleLine(line, stream);
        });
        source.on('end', () => handleLine(partial, stream));
      };
      read('out');
      read('err');
      // 'close' fires after both streams have ended, so the error includes R's last output.
      this.proc.on('close', (code, signal) => {
        if (!this.url) fail(`exited before listening (code ${code}, signal ${signal})`);
      });
    });
  }

  /** Number of captured log lines; pass to logs() to get only what came after. */
  get logLength(): number {
    return this.lines.length;
  }

  /** Captured R stdout/stderr (stderr lines are prefixed with "[stderr]"). */
  logs(fromLine = 0, toLine?: number): string {
    return this.lines.slice(fromLine, toLine).join('\n');
  }

  /** Kill the R process and everything it started. */
  async stop(): Promise<void> {
    const { pid } = this.proc;
    if (pid === undefined || this.proc.exitCode !== null || this.proc.signalCode !== null) return;
    const exited = new Promise<void>((resolve) => this.proc.once('exit', () => resolve()));
    if (process.platform === 'win32') {
      try {
        execFileSync('taskkill', ['/pid', String(pid), '/T', '/F'], { stdio: 'ignore' });
      } catch {
        // already gone
      }
      await exited;
      return;
    }
    const killGroup = (signal: NodeJS.Signals) => {
      try {
        process.kill(-pid, signal);
      } catch {
        // already gone
      }
    };
    killGroup('SIGTERM');
    const timeout = new Promise<'timeout'>((resolve) => setTimeout(() => resolve('timeout'), STOP_TIMEOUT_MS));
    if ((await Promise.race([exited, timeout])) === 'timeout') {
      killGroup('SIGKILL');
      await exited;
    }
  }
}
