import { defineShinyConfig } from '@appsilon/shiny-playwright';

export default defineShinyConfig({
  use: {
    ignoreConsoleErrors: [
      // Fluent UI's makeStyles() adds a window "unload" listener (still in @fluentui/react 8.125.10). Google Chrome
      // no longer allows unload listeners and logs this instead. The listener only cleans up when the page closes.
      /^Permissions policy violation: unload is not allowed in this document\.$/,
    ],
    // The test app's Calendar and DatePicker values are UTC timestamps; their expected labels assume a UTC browser.
    timezoneId: 'UTC',
  },
});
