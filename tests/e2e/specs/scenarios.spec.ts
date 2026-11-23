// Ported from js/cypress/e2e/e2e-test/scenarios.cy.js.
import { expect, test } from '@appsilon/shiny-playwright';

test.use({ app: 'inst/examples/e2e-test' });

test.beforeEach(async ({ shiny }) => {
  await shiny.goto();
});

test.afterEach(async ({ shiny }) => {
  await shiny.expectNoErrors();
});

test.describe('Raw JS', () => {
  test('runs on the client', async ({ page }) => {
    // The Pivot's onLinkClick is JS() that calls alert(). Record every dialog and close it, so the page goes on.
    const dialogs: string[] = [];
    page.on('dialog', (dialog) => {
      dialogs.push(`${dialog.type()}: ${dialog.message()}`);
      void dialog.accept();
    });
    // The page has other Pivots with a "Tab 2"; this one follows the "Scenarios tests" heading.
    const tab = page.locator('h1:text-is("Scenarios tests") + *').getByRole('tab', { name: 'Tab 2' });
    await tab.click();
    // The Pivot selects the tab only after onLinkClick has returned, i.e. after every alert it opened was closed.
    await expect(tab).toHaveAttribute('aria-selected', 'true');
    expect(dialogs).toEqual(['alert: Pivot tab switched']);
  });
});
