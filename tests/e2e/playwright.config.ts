import { defineConfig, devices } from '@playwright/test';
import type { HarnessOptions } from './harness';

export default defineConfig<HarnessOptions>({
  testDir: './specs',
  globalSetup: './harness/global-setup.ts',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  // No retries during the PoC: a flaky test should fail loudly, not pass on a retry.
  retries: 0,
  reporter: [['list'], ['html', { open: 'never' }]],
  use: {
    ignoreConsoleErrors: [
      // Fluent UI's makeStyles() adds a window "unload" listener (still in @fluentui/react 8.125.10). Google Chrome
      // no longer allows unload listeners and logs this instead. The listener only cleans up when the page closes.
      /^Permissions policy violation: unload is not allowed in this document\.$/,
    ],
    // The test app's Calendar and DatePicker values are UTC timestamps; their expected labels assume a UTC browser.
    timezoneId: 'UTC',
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
  },
  projects: [
    {
      name: 'chromium',
      use: {
        ...devices['Desktop Chrome'],
        // In CI, use the Google Chrome that comes with the GitHub runner image. Playwright's own Chromium
        // needs system packages from the Ubuntu mirror (`--with-deps`), which is slow and sometimes fails.
        channel: process.env.CI ? 'chrome' : undefined,
      },
    },
  ],
});
