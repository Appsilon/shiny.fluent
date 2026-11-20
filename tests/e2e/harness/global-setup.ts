import { execFileSync } from 'node:child_process';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { PKG_ROOT } from './paths';

/**
 * Install the package from the current source into a throwaway library, once per run.
 * Every app process puts this library first on its library path, so apps always
 * test the code in this checkout, never a previously installed version.
 * Each run gets its own library, so two runs from the same checkout don't interfere.
 */
export default function globalSetup() {
  const lib = fs.mkdtempSync(path.join(os.tmpdir(), 'shiny-e2e-lib-'));
  // Workers inherit the runner's environment; shiny-app.ts reads it from there.
  process.env.E2E_LIB = lib;

  const started = Date.now();
  try {
    execFileSync(
      'R',
      ['CMD', 'INSTALL', '--no-docs', '--no-multiarch', '--no-test-load', `--library=${lib}`, PKG_ROOT],
      { stdio: 'pipe' },
    );
  } catch (error) {
    fs.rmSync(lib, { recursive: true, force: true });
    const { stdout = '', stderr = '' } = error as { stdout?: Buffer; stderr?: Buffer };
    throw new Error(`Installing the package from ${PKG_ROOT} failed:\n${stdout}${stderr}`);
  }
  console.log(`[e2e] Installed package from source in ${((Date.now() - started) / 1000).toFixed(1)}s`);

  // Returned function = global teardown.
  return () => fs.rmSync(lib, { recursive: true, force: true });
}
