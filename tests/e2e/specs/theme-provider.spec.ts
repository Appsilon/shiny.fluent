// Ported from js/cypress/e2e/e2e-test/themeProvider.cy.js: ThemeProvider() applies a custom theme to its content.
import { expect, test } from '@appsilon/shiny-playwright';

test.use({ app: 'inst/examples/e2e-test' });

test.beforeEach(async ({ shiny }) => {
  await shiny.goto();
});

test.afterEach(async ({ shiny }) => {
  await shiny.expectNoErrors();
});

// From the theme in inst/examples/e2e-test/R/themeProvider.R.
const BACKGROUND = 'rgb(50, 49, 48)'; // palette$white, #323130
const PRIMARY = 'rgb(141, 212, 0)'; // palette$themePrimary, #8dd400

test.describe('ThemeProvider()', () => {
  test('should set background color', async ({ page }) => {
    // ThemeProvider renders its content in a div with a generated "body-<n>" class that carries the theme's background.
    const root = page.locator('[data-cy="themeProvider-themeProviderContent"] div[class^="body-"]');
    await expect(root).toHaveCSS('background-color', BACKGROUND);
  });

  test('should set style of a PrimaryButton', async ({ page }) => {
    const button = page.locator('[data-cy="themeProvider-themeProviderContent"] button[data-cy="themeProvider-button"]');
    await expect(button).toHaveCSS('background-color', PRIMARY);
    await expect(button).toHaveCSS('color', BACKGROUND);
  });
});
