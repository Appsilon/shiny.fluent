# End-to-end tests

Browser tests for shiny.fluent, written with [Playwright](https://playwright.dev). They start real Shiny
apps that use the package **built from this checkout** and drive them in Chromium.

The specs here are ported from the Cypress tests in `js/cypress/e2e/` and run against the same apps:
`inst/examples/e2e-test`, and the example dashboard `inst/examples/dashboard` for `dashboard.spec.ts`. The Cypress
specs still run in `ci.yml`.

This folder is excluded from the package build (`.Rbuildignore`), so `R CMD check` and CRAN never see it.

## Running

Prerequisites: R with the package's dependencies installed (`shiny` etc.) plus the packages in `Config/Needs/e2e`
in `DESCRIPTION` (e.g. `pak::local_install_deps(dependencies = "Config/Needs/e2e")`), and Node.js 20 or newer.

```sh
cd tests/e2e
npm ci                               # first time, or after package-lock.json changes
npx playwright install chromium      # first time, or after upgrading @playwright/test
npm test                             # run everything
```

Useful variants:

| Command | What it does |
|---|---|
| `npm test -- specs/fluent-inputs.spec.ts` | Run one file |
| `npm test -- -g "Dropdown"` | Run tests whose title matches |
| `npm run test:ui` | Interactive UI mode: watch, time-travel, pick locators |
| `npm test -- --headed --debug` | Step through a test in a visible browser |
| `npm run report` | Open the HTML report of the last run |
| `npx playwright show-trace test-results/<test>/trace.zip` | Inspect a failed test's trace |

When a test fails, its folder in `test-results/` holds a screenshot, a trace, and `app.log` with the app's R
output. An app can serve several tests, so the log marks the line where the failed test started. (If the app
fails to start, there is no `app.log`: the error message includes the R output.)

To run against another Shiny version, install it into a separate library and put that library on `R_LIBS`, e.g.
`R_LIBS=/path/to/shiny-1.7.5.1-lib npm test`.

### In CI

`.github/workflows/e2e.yml` runs `npm test` on ubuntu, once with the oldest Shiny version we test (1.7.5.1) and
once with the current CRAN release. It runs only when the package (including `inst/`) or the e2e tests change. In CI
the tests use the Google Chrome that comes with the GitHub runner (`CI` is set), not Playwright's own Chromium:
that avoids installing browser system packages on every run. To reproduce CI locally with your own Chrome, run
`CI=1 npm test`. If tests fail, download the `e2e-shiny-<version>` artifact: it holds the HTML report and, per
failed test, the trace and `app.log`. If the job fails in an earlier step (e.g. while installing R), there is no
artifact; read the job log.

## How it works

1. **Install from source.** Before the tests start, `harness/global-setup.ts` runs `R CMD INSTALL` into
   a temporary library, one per run. Every app process puts that library first on its library path (and stops
   if the package would load from anywhere else), so `library(shiny.fluent)` always loads the code in your working
   tree. You never need to reinstall the package by hand. Exception: UI mode (`npm run test:ui`) installs once
   when it starts, so restart it after changing the package.
2. **One R process per app.** The `shiny` fixture starts the app a test asks for in its own R process, on a port R
   picks itself. Each app starts at most once per worker and is reused across tests; every test still gets a fresh
   browser page and therefore a fresh Shiny session.
3. **Clean shutdown.** App processes are killed when the worker finishes. If the test runner is killed hard, the R
   process notices that its parent is gone and quits within about a second (Linux and macOS, as long as the app is
   not stuck in a long R computation).

### The JavaScript bundle

The tests use the committed bundle, `inst/www/shiny.fluent/shiny-fluent.js`, because that is what users install.
After changing `js/src`, rebuild it (`yarn webpack` in `js/`) before running the tests, or they test the old code.

## Writing a test

```ts
import path from 'node:path';
import { expect, test } from '../harness';
import { PKG_ROOT } from '../harness/paths';

test.use({ app: path.join(PKG_ROOT, 'inst', 'examples', 'e2e-test') }); // or a folder name under apps/

test('Toggle.shinyInput() sends its value to the server', async ({ page, shiny }) => {
  await shiny.goto();                      // open the app, wait until Shiny is connected and idle
  await page.locator('button#fluentInputs-toggle').click();                 // real clicks
  await expect(page.locator('button#fluentInputs-toggle')).toHaveAttribute('aria-checked', 'false');
  await expect(page.locator('#fluentInputs-toggleValue')).toHaveText('Value: FALSE'); // what the server sees
  await shiny.expectNoErrors();            // still connected, no output errors, no JS console errors
});
```

Guidelines:

- **Never sleep.** Do not use `page.waitForTimeout()`. Use `await expect(locator)...` or `expect.poll(...)`, which
  retry until the UI catches up.
- **Use the test app.** Add what you need to `inst/examples/e2e-test` (one module per area), or a small app in a
  new `apps/<name>/` folder. If an app needs a package that is not in `Imports`, add it to `Config/Needs/e2e` in
  `DESCRIPTION`; CI installs those.
- **Popups render elsewhere.** A Dropdown list, Callout, Panel or Modal opens in a Fluent Layer at the end of
  `<body>`, not inside the component. Find it by its own id (e.g. `#<inputId>-list`), not inside the component.
- **Click what a user clicks.** Some Fluent inputs hide the native `<input>` behind a styled element (Checkbox: click
  `label[for="<inputId>"]`). Avoid `{ force: true }`: it skips the checks that the element is visible and enabled.
- **Known harmless console errors** go in `ignoreConsoleErrors` in `playwright.config.ts`, each with a comment
  saying why it is safe. Fluent UI's own `unload` listener is the one listed now.
- **A known bug** gets a test marked `test.fail()` with a comment. It fails loudly once the bug is fixed, as a
  reminder to remove the mark.
- `shiny.logs()` returns the R output captured since the test started, e.g. to assert that a warning was printed.

### `shiny` fixture

| Member | Purpose |
|---|---|
| `goto(path?)` | Open the app; wait until Shiny is connected and finished its first round of work. Fails immediately, with the R output, if the session dies. |
| `selectOption(inputId, value)` | Choose a value in a `selectInput` like a user would (selectize or native). |
| `inputValue(inputId)` | The value of a Shiny input as the client last sent it to the server. |
| `waitForIdle()` | Wait until Shiny is connected and not busy. Only needed in special cases; prefer assertions. |
| `logs()` | R stdout/stderr of the app since this test started. |
| `expectNoErrors()` | Wait until Shiny has been idle for 0.5 s (so outputs created by `renderUI()` have rendered), then assert there is no disconnect overlay, no visible output error, and no browser console error. |
| `app.url` | Base URL of the running app. |

## Layout

```
specs/       test files (*.spec.ts)
harness/     test infrastructure: install from source, app processes, Shiny helpers
```
