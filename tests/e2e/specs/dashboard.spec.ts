// Ported from js/cypress/e2e/dashboard/dashboard.cy.js: the example dashboard (inst/examples/dashboard), whose pages
// are shiny.router routes such as /#!/Slider.
import path from 'node:path';
import { expect, test } from '../harness';
import { PKG_ROOT } from '../harness/paths';

test.use({ app: path.join(PKG_ROOT, 'inst', 'examples', 'dashboard') });

test.afterEach(async ({ shiny }) => {
  await shiny.expectNoErrors();
});

// Each live example is in a div with the example's name as id, and its module uses that id as namespace.
test.describe('Dashboard', () => {
  test('Slider', async ({ page, shiny }) => {
    await shiny.goto('/#!/Slider');
    const slider = page.locator('#Slider .ms-Slider-slideBox');
    for (let i = 0; i < 15; i++) await slider.press('ArrowRight');
    await expect(slider).toHaveAttribute('aria-valuenow', '15');
    await expect(page.locator('#Slider-sliderValue')).toHaveText('Value: 15');
  });

  test('Dropdown', async ({ page, shiny }) => {
    await shiny.goto('/#!/Dropdown');
    await page.locator('#Dropdown-dropdown-option').click();
    // The list opens in a Fluent Layer at the end of <body>.
    await page.locator('#Dropdown-dropdown-list2').click();
    await expect(page.locator('#Dropdown-dropdown-option')).toHaveText('Option C');
    await expect(page.locator('#Dropdown-dropdownValue')).toHaveText('Value: C');
  });
});
