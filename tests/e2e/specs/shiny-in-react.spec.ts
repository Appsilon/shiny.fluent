// Ported from js/cypress/e2e/e2e-test/shinyInReact.cy.js: Shiny inputs inside Fluent (React) components.
import type { Page } from '@playwright/test';
import { expect, test } from '@appsilon/shiny-playwright';

test.use({ app: 'inst/examples/e2e-test' });

test.beforeEach(async ({ shiny }) => {
  await shiny.goto();
});

test.afterEach(async ({ shiny }) => {
  await shiny.expectNoErrors();
});

// Each input has a text output "<id>Value" that shows the value the server received.
async function expectTextInputWorks(page: Page, id: string, text: string) {
  await page.locator(`#shinyInReact-${id}`).fill(text);
  await expect(page.locator(`#shinyInReact-${id}`)).toHaveValue(text);
  await expect(page.locator(`#shinyInReact-${id}Value`)).toHaveText(`Value: ${text}`);
}

async function expectCheckboxWorks(page: Page, id: string) {
  await page.locator(`#shinyInReact-${id}`).check();
  await expect(page.locator(`#shinyInReact-${id}`)).toBeChecked();
  await expect(page.locator(`#shinyInReact-${id}Value`)).toHaveText('Value: TRUE');
}

const RENDERINGS = [
  // The inputs are in a Pivot tab that is not shown at first, so React mounts them only on the tab switch.
  {
    name: 'hidden in a Pivot',
    suffix: 'Hidden',
    open: (page: Page) => page.locator('button[data-content="Initially hidden components"]').click(),
  },
  { name: 'rendered dynamically (renderUI)', suffix: 'Dynamic', open: async () => {} },
  { name: 'rendered statically', suffix: 'Static', open: async () => {} },
];

for (const { name, suffix, open } of RENDERINGS) {
  test.describe(`Shiny inputs ${name}`, () => {
    test.beforeEach(async ({ page }) => {
      await open(page);
    });

    test('textInput() sends its value to the server', async ({ page }) => {
      await expectTextInputWorks(page, `textInput${suffix}`, 'my text');
    });

    test('textAreaInput() sends its value to the server', async ({ page }) => {
      await expectTextInputWorks(page, `textAreaInput${suffix}`, 'some text');
    });

    test('checkboxInput() sends its value to the server', async ({ page }) => {
      await expectCheckboxWorks(page, `checkboxInput${suffix}`);
    });
  });
}

test('a static textInput() is updated from the server', async ({ page }) => {
  await page.locator('#shinyInReact-updateInputs').click();
  await expect(page.locator('#shinyInReact-textInputStatic')).toHaveValue('new text');
  await expect(page.locator('#shinyInReact-textInputStaticValue')).toHaveText('Value: new text');
});
