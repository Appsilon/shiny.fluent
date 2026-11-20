// Ported from js/cypress/e2e/e2e-test/actionButtons.cy.js.
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

const BUTTONS = [
  'DefaultButton',
  'PrimaryButton',
  'CompoundButton',
  'ActionButton',
  'CommandBarButton',
  'CommandButton',
  'IconButton',
];

test.describe('clicking a button sends an event to the server', () => {
  for (const button of BUTTONS) {
    test(`${button}.shinyInput()`, async ({ page }) => {
      const id = button.charAt(0).toLowerCase() + button.slice(1);
      await page.locator(`#actionButtons-${id}`).click();
      await expect(page.locator('#actionButtons-clicks')).toHaveText('Number of clicks: 1');
    });
  }
});

test.describe('updating buttons from the server', () => {
  test.beforeEach(async ({ page }) => {
    await page.locator('#actionButtons-update').click();
  });

  const label = (page: Page, id: string) => page.locator(`#actionButtons-${id} .ms-Button-label`);

  test('DefaultButton.shinyInput()', async ({ page }) => {
    await expect(label(page, 'defaultButton')).toHaveText('Default Button Updated');
  });

  test('PrimaryButton.shinyInput()', async ({ page }) => {
    await expect(label(page, 'primaryButton')).toHaveText('Primary Button Updated');
  });

  test('CompoundButton.shinyInput()', async ({ page }) => {
    await expect(label(page, 'compoundButton')).toHaveText('Compound Button Updated');
    await expect(page.locator('#actionButtons-compoundButton .ms-Button-description')).toHaveText(
      'Compound Button additional text updated',
    );
  });

  test('ActionButton.shinyInput()', async ({ page }) => {
    const button = page.locator('#actionButtons-actionButton');
    await expect(label(page, 'actionButton')).toHaveText('Action Button Disabled');
    await expect(button.locator('.ms-Icon')).toHaveAttribute('data-icon-name', 'Download');
    await expect(button).toHaveAttribute('aria-disabled', 'true');
  });

  test('CommandBarButton.shinyInput()', async ({ page }) => {
    await expect(label(page, 'commandBarButton')).toHaveText('Command Bar Button Updated');
  });

  test('CommandButton.shinyInput()', async ({ page }) => {
    await expect(label(page, 'commandButton')).toHaveText('Command Button Updated');
  });

  test('IconButton.shinyInput()', async ({ page }) => {
    await expect(page.locator('#actionButtons-iconButton .ms-Icon')).toHaveAttribute('data-icon-name', 'Download');
  });
});
