// Ported from js/cypress/e2e/e2e-test/deepMixing.cy.js: Fluent components and Shiny outputs nested in each other.
import path from 'node:path';
import type { Locator } from '@playwright/test';
import { expect, test } from '../harness';
import { PKG_ROOT } from '../harness/paths';

test.use({ app: path.join(PKG_ROOT, 'inst', 'examples', 'e2e-test') });

test.beforeEach(async ({ shiny }) => {
  await shiny.goto();
});

test.afterEach(async ({ shiny }) => {
  await shiny.expectNoErrors();
});

/** The Leaflet output in the selected tab of `pivot` is shown, and Leaflet drew the map in it. */
async function expectMapIn(pivot: Locator) {
  const map = pivot.getByRole('tabpanel').locator('#deepMixing-map');
  await expect(map).toBeVisible();
  // The output's div is visible even if Leaflet never draws; a marker shows the map was rendered.
  await expect(map.locator('.leaflet-marker-icon').first()).toBeVisible();
}

test.describe('Fluent components inside Shiny tabset', () => {
  test.beforeEach(async ({ page }) => {
    // The components start in the tab that is not shown, so they become visible only through the tab switch.
    await expect(page.locator('[data-cy="deepMixing-label"]')).toBeHidden();
    await page.locator('#deepMixing-tabs1').getByText('JSX', { exact: true }).click();
  });

  test('Label is visible', async ({ page }) => {
    await expect(page.locator('[data-cy="deepMixing-label"]')).toBeVisible();
  });

  test('PrimaryButton is visible', async ({ page }) => {
    await expect(page.locator('[data-cy="deepMixing-primaryButton"]')).toBeVisible();
  });
});

test.describe('JSX inside uiOutput inside JSX', () => {
  test('Leaflet inside Pivot is visible', async ({ page }) => {
    const pivot = page.locator('[data-cy="deepMixing-pivot"]');
    await pivot.getByRole('tab', { name: 'Leaflet inside a Pivot' }).click();
    await expectMapIn(pivot);
  });
});

test.describe('Leaflet in Pivot in uiOutput in Pivot in uiOutput in JSX', () => {
  test('Leaflet inside nested Pivot is visible', async ({ page }) => {
    await page.locator('[data-cy="deepMixing-pivot"]').getByRole('tab', { name: 'Another level of nesting' }).click();
    const nested = page.locator('[data-cy="deepMixing-nestedPivot"]');
    await nested.getByRole('tab', { name: 'Leaflet inside a Pivot' }).click();
    await expectMapIn(nested);
  });
});
