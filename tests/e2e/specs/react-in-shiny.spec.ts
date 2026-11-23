// Ported from js/cypress/e2e/e2e-test/reactInShiny.cy.js: Fluent (React) components in a Shiny layout, static and
// rendered dynamically with renderReact().
import path from 'node:path';
import { expect, test } from '../harness';
import { PKG_ROOT } from '../harness/paths';

test.use({ app: path.join(PKG_ROOT, 'inst', 'examples', 'e2e-test') });

test.beforeEach(async ({ shiny }) => {
  await shiny.goto();
});

test.afterEach(async ({ shiny }) => {
  await shiny.expectNoErrors();
});

test.describe('Label()', () => {
  test('exists in DOM', async ({ page }) => {
    const label = page.locator('#reactInShiny-label');
    await expect(label).toHaveClass(/\bms-Label\b/);
    await expect(label).toHaveText("I'm a Label");
  });
});

test.describe('Icon()', () => {
  const compass = '#reactInShiny-compass';

  test('exists in DOM', async ({ page }) => {
    await expect(page.locator(compass)).toHaveClass(/\bms-Icon\b/);
  });

  test('setting style attribute works', async ({ page }) => {
    const icon = page.locator(compass);
    await expect(icon).toHaveAttribute('data-icon-name', 'CompassNW');
    // The Cypress spec checked the inline style text; the computed style also shows the browser applied it.
    await expect(icon).toHaveCSS('width', '50px');
    await expect(icon).toHaveCSS('height', '50px');
    await expect(icon).toHaveCSS('font-size', '50px');
    await expect(icon).toHaveCSS('margin', '10px');
    await expect(icon).toHaveCSS('color', 'rgb(0, 191, 255)'); // deepskyblue
  });
});

test.describe('Spinner()', () => {
  const spinner = '#reactInShiny-spinner';

  test('exists in DOM', async ({ page }) => {
    await expect(page.locator(spinner)).toHaveClass(/\bms-Spinner\b/);
  });

  test('has spinner circle', async ({ page }) => {
    await expect(page.locator(spinner).locator('.ms-Spinner-circle')).toBeVisible();
  });

  test('has correct label', async ({ page }) => {
    await expect(page.locator(spinner).locator('.ms-Spinner-label')).toHaveText('I am definitely loading...');
  });
});

test.describe('Dynamic rendering', () => {
  test('Label works', async ({ page }) => {
    const label = page.locator('[data-cy="reactInShiny-label"]');
    await expect(label).toHaveText("I'm a Label with count value = 0");
    await page.getByLabel('Insert some value').fill('10');
    await expect(label).toHaveText("I'm a Label with count value = 10");
  });

  test('PrimaryButton works', async ({ page }) => {
    await expect(page.locator('[data-cy="reactInShiny-primaryButton"] .ms-Button-label')).toHaveText('PrimaryButton');
  });

  test('TeachingBubble works', async ({ page }) => {
    const toggle = page.locator('[data-cy="reactInShiny-toggle"]');
    // The bubble opens in a Fluent Layer at the end of <body>.
    const bubbleText = page.locator('.ms-TeachingBubble-body > .ms-TeachingBubble-subText');
    await toggle.click();
    await expect(bubbleText).toHaveText('Very useful!');
    await toggle.click();
    await expect(bubbleText).toHaveCount(0);
  });

  test('Modal works', async ({ page }) => {
    const heading = page.locator('[data-cy="reactInShiny-modal-h1"]');
    await page.locator('[data-cy="reactInShiny-showModal"]').click();
    await expect(heading).toHaveText('This is an important message');
    await expect(page.locator('[data-cy="reactInShiny-modal-p"]')).toHaveText('Read this text to learn more.');
    await page.locator('[data-cy="reactInShiny-hideModal"]').click();
    await expect(heading).toHaveCount(0);
  });

  test('Pivot works', async ({ page }) => {
    const pivot = page.locator('[data-cy="reactInShiny-pivot"]');
    await pivot.getByRole('tab', { name: 'Tab 2' }).click();
    await expect(pivot.locator('[data-cy="reactInShiny-pivotLabel"]')).toHaveText('Hello 2');
  });

  test('Leaflet in pivot works', async ({ page }) => {
    const pivot = page.locator('[data-cy="reactInShiny-pivot"]');
    await pivot.getByRole('tab', { name: 'Tab 2' }).click();
    const map = page.locator('#reactInShiny-map');
    await expect(map).toBeVisible();
    // The output's div is visible even if Leaflet never draws; a marker shows the map was rendered.
    await expect(map.locator('.leaflet-marker-icon').first()).toBeVisible();
  });
});
