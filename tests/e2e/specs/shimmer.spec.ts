// Ported from js/cypress/e2e/e2e-test/shimmer.cy.js: ShimmeredDetailsList() inside renderUI().
import path from 'node:path';
import type { Page } from '@playwright/test';
import { expect, test } from '../harness';
import { PKG_ROOT } from '../harness/paths';

test.use({ app: path.join(PKG_ROOT, 'inst', 'examples', 'e2e-test') });

test.beforeEach(async ({ shiny }) => {
  await shiny.goto();
});

test.afterEach(async ({ shiny }) => {
  await shiny.expectNoErrors();
});

const list = (page: Page) => page.locator('#shimmer-shimmeredDetailsListOutput');

test.describe('ShimmeredDetailsList()', () => {
  test('is placed in DOM with appropriate props and dimensions', async ({ page }) => {
    // ariaLabelForShimmer names the grid while the shimmer is on; the columns come from the `columns` prop.
    const grid = list(page).getByRole('grid', { name: 'Content is being fetched' });
    await expect(grid).toBeVisible();
    await expect(grid.getByRole('columnheader', { name: 'Name', exact: true })).toBeVisible();
    await expect(grid.getByRole('columnheader', { name: 'Surname', exact: true })).toBeVisible();
  });

  test('contains given number of rows', async ({ page }) => {
    await expect(list(page).locator('.ms-List-page > .ms-List-cell')).toHaveCount(10);
  });

  test('enabled shimmer hides data', async ({ page }) => {
    // Every row is a shimmer placeholder, and none of the items' data is shown.
    await expect(list(page).locator('.ms-List-cell > .ms-Shimmer-container')).toHaveCount(10);
    await expect(list(page).getByText('Mark')).toHaveCount(0);
  });

  test('disabled shimmer shows data', async ({ page }) => {
    await page.getByLabel('Enable shimmer').uncheck();
    const grid = list(page).getByRole('grid', { name: 'Item details' });
    await expect(grid).toHaveAttribute('aria-busy', 'false');
    const cell = (row: number, column: string) =>
      grid.locator(`[data-list-index="${row}"] [data-automation-key="${column}"]`);
    await expect(cell(0, 'name')).toHaveText('Mark');
    await expect(cell(0, 'surname')).toHaveText('Swanson');
    await expect(cell(1, 'name')).toHaveText('Josh');
    await expect(cell(1, 'surname')).toHaveText('Johnson');
  });
});
