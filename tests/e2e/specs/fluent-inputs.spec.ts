// Ported from js/cypress/e2e/e2e-test/fluentComponents.cy.js: Fluent inputs (*.shinyInput()) send their values to
// the server, reset when re-rendered, and follow update*.shinyInput() from the server.
import type { Page } from '@playwright/test';
import { expect, test } from '@appsilon/shiny-playwright';

test.use({ app: 'inst/examples/e2e-test' });

test.beforeEach(async ({ shiny }) => {
  await shiny.goto();
});

test.afterEach(async ({ shiny }) => {
  await shiny.expectNoErrors();
});

// Each input "fluentInputs-<id>" has a text output "fluentInputs-<id>Value" showing the value the server received.
const byId = (page: Page, id: string) => page.locator(`#fluentInputs-${id}`);
const output = (page: Page, id: string) => page.locator(`#fluentInputs-${id}Value`);

/** Hide and show the inputs again: renderUI() re-creates them with their initial values. */
async function toggleVisibility(page: Page) {
  const hidden = page.getByText('Items are hidden');
  await byId(page, 'toggleInputs').click();
  await expect(hidden).toBeVisible();
  await byId(page, 'toggleInputs').click();
  await expect(hidden).toBeHidden();
}

async function clickUpdate(page: Page) {
  await byId(page, 'updateInputs').click();
}

// Slider

const slideBox = (page: Page) => page.locator('#fluentInputs-panelFluent .ms-Slider [class*=ms-Slider-slideBox]');

async function sliderDefault(page: Page, now = 0, min = -100, max = 234) {
  await expect(slideBox(page)).toHaveAttribute('aria-valuenow', String(now));
  await expect(slideBox(page)).toHaveAttribute('aria-valuemin', String(min));
  await expect(slideBox(page)).toHaveAttribute('aria-valuemax', String(max));
  await expect(output(page, 'sliderInput')).toHaveText(`Value: ${now}`);
}

async function sliderChange(page: Page) {
  // Cypress's type() clicked the slider first, which moved it to wherever the click landed (118 there). Arrow keys
  // alone move it by one step.
  await expect(slideBox(page)).toHaveAttribute('aria-valuenow', '0');
  await slideBox(page).press('ArrowRight');
  await expect(slideBox(page)).toHaveAttribute('aria-valuenow', '1');
  await expect(output(page, 'sliderInput')).toHaveText('Value: 1');
}

// TextField

async function textFieldDefault(page: Page, text = '') {
  await expect(byId(page, 'textField')).toHaveValue(text);
  await expect(output(page, 'textField')).toHaveText(`Value: ${text}`);
}

async function textFieldChange(page: Page, text = 'some text') {
  await byId(page, 'textField').fill(text);
  await expect(byId(page, 'textField')).toHaveValue(text);
  await expect(output(page, 'textField')).toHaveText(`Value: ${text}`);
}

// Checkbox

async function checkboxChecked(page: Page, checked: boolean) {
  if (checked) await expect(byId(page, 'checkbox')).toBeChecked();
  else await expect(byId(page, 'checkbox')).not.toBeChecked();
  await expect(output(page, 'checkbox')).toHaveText(`Value: ${checked ? 'TRUE' : 'FALSE'}`);
}

async function checkboxChange(page: Page) {
  // The <input> is visually hidden behind Fluent's styled box; click the box like a user would.
  await page.locator('label[for="fluentInputs-checkbox"]').click();
  await checkboxChecked(page, true);
}

// Rating

const star = (page: Page, value: number) => byId(page, 'rating').locator(`[id$=star-${value - 1}]`);

async function ratingDefault(page: Page, value = 2) {
  await expect(star(page, value)).toHaveAttribute('aria-checked', 'true');
  await expect(output(page, 'rating')).toHaveText(`Value: ${value}`);
}

async function ratingChange(page: Page, value = 5) {
  await star(page, value).click();
  await ratingDefault(page, value);
}

// SpinButton

const spinInput = (page: Page) => byId(page, 'spinButton').locator('.ms-spinButton-input');

async function spinButtonDefault(page: Page, now = 15, min = 0, max = 50) {
  await expect(spinInput(page)).toHaveAttribute('aria-valuenow', String(now));
  await expect(spinInput(page)).toHaveAttribute('aria-valuemin', String(min));
  await expect(spinInput(page)).toHaveAttribute('aria-valuemax', String(max));
  await expect(output(page, 'spinButton')).toHaveText(`Value: ${now}`);
}

async function spinButtonType(page: Page, value = 50) {
  await spinInput(page).fill(String(value));
  // SpinButton commits a typed value on blur.
  await spinInput(page).blur();
  await expect(spinInput(page)).toHaveAttribute('aria-valuenow', String(value));
  await expect(output(page, 'spinButton')).toHaveText(`Value: ${value}`);
}

async function spinButtonArrows(page: Page) {
  const spin = byId(page, 'spinButton');
  await spin.locator('[class*=ms-Button][class*=ms-DownButton]').click();
  await expect(spinInput(page)).toHaveAttribute('aria-valuenow', '10');
  await expect(output(page, 'spinButton')).toHaveText('Value: 10');
  await spin.locator('[class*=ms-Button][class*=ms-UpButton]').click();
  await spin.locator('[class*=ms-Button][class*=ms-UpButton]').click();
  await expect(spinInput(page)).toHaveAttribute('aria-valuenow', '20');
  await expect(output(page, 'spinButton')).toHaveText('Value: 20');
}

// Calendar

async function calendarDefault(page: Page, date = '25, June, 2020', dttm = '2020-06-25T12:00:00.000Z') {
  await expect(byId(page, 'calendar').locator(`[aria-label="${date}"]`).locator('..')).toHaveAttribute(
    'aria-selected',
    'true',
  );
  await expect(output(page, 'calendar')).toHaveText(`Value: ${dttm}`);
}

async function calendarTodayOnLoad(page: Page) {
  for (const id of ['calendarDefault', 'calendarNull']) {
    await expect(byId(page, id).locator('.ms-CalendarDay-dayIsToday').locator('..')).toHaveAttribute(
      'aria-selected',
      'true',
    );
  }
}

// ChoiceGroup

async function choiceGroupDefault(page: Page, selected = 'B') {
  const group = byId(page, 'choiceGroup');
  await expect(
    group.locator(`label[class^=ms-ChoiceField][class*=is-checked] > span[id^=ChoiceGroupLabel][id$=-${selected}]`),
  ).toHaveCount(1);
  for (const key of ['A', 'B', 'C']) {
    await expect(group.locator(`input[id^=ChoiceGroup][id$=-${key}]`)).toHaveCount(1);
    await expect(group.locator(`label[class^=ms-ChoiceField] span[id^=ChoiceGroupLabel][id$=-${key}]`)).toHaveText(
      `Option ${key}`,
    );
  }
  await expect(output(page, 'choiceGroup')).toHaveText(`Value: ${selected}`);
}

async function choiceGroupChange(page: Page) {
  const optionC = byId(page, 'choiceGroup').locator('label[class^=ms-ChoiceField][for*=-C]');
  await optionC.click();
  await expect(optionC).toHaveClass(/is-checked/);
  await expect(output(page, 'choiceGroup')).toHaveText('Value: C');
}

// ColorPicker

const hexInput = (page: Page) => page.locator('#fluentInputs-panelFluent .ms-ColorPicker input[aria-label="Hex"]');

async function colorPickerDefault(page: Page, color = '00ff01') {
  await expect(hexInput(page)).toHaveValue(color);
  await expect(output(page, 'colorPicker')).toHaveText(`Value: #${color.toUpperCase()}`);
}

async function colorPickerChange(page: Page, color = 'ffffff') {
  await hexInput(page).fill(color);
  await expect(output(page, 'colorPicker')).toHaveText(`Value: #${color}`);
}

// ComboBox

const comboInput = (page: Page) => byId(page, 'comboBox-input');

async function comboBoxDefault(page: Page, value = 'some text', shown = value) {
  await expect(comboInput(page)).toHaveValue(value);
  await expect(output(page, 'comboBox')).toHaveText(`Value: ${shown}`);
}

async function comboBoxChange(page: Page) {
  await comboInput(page).fill('Option A');
  await comboInput(page).press('Enter');
  await expect(output(page, 'comboBox')).toHaveText('Value: A');
  await comboInput(page).fill('New value');
  await comboInput(page).press('Enter');
  await expect(output(page, 'comboBox')).toHaveText('Value: New value');
}

// Dropdown

async function dropdownDefault(page: Page, text = 'Option A', value = 'A') {
  await expect(byId(page, 'dropdown-option')).toHaveText(text);
  await expect(output(page, 'dropdown')).toHaveText(`Value: ${value}`);
}

async function dropdownChange(page: Page) {
  await byId(page, 'dropdown-option').click();
  // The list opens in a Fluent Layer, a portal at the end of <body>, outside the dropdown's own element.
  await expect(byId(page, 'dropdown-list')).toBeVisible();
  await byId(page, 'dropdown-list2').click();
  await dropdownDefault(page, 'Option C', 'C');
}

async function multiselectDefault(page: Page, text = 'Option A, Option C', values = 'Value: A Value: C') {
  await expect(byId(page, 'dropdownMultiselect-option')).toHaveText(text);
  await expect(output(page, 'dropdownMultiselect')).toHaveText(values);
}

async function multiselectChange(page: Page) {
  await byId(page, 'dropdownMultiselect-option').click();
  await expect(byId(page, 'dropdownMultiselect-list')).toBeVisible();
  // Deselect A, select B.
  await byId(page, 'dropdownMultiselect-list0').locator('..').click();
  await byId(page, 'dropdownMultiselect-list1').locator('..').click();
  await multiselectDefault(page, 'Option C, Option B', 'Value: C Value: B');
  await page.keyboard.press('Escape');
  await expect(byId(page, 'dropdownMultiselect-list')).toBeHidden();
}

// DatePicker

async function datePickerDefault(page: Page, date = 'Thu Jun 25 2020', dttm = '2020-06-25T12:00:00.000Z') {
  await expect(byId(page, 'datePicker-label')).toContainText(date);
  await expect(output(page, 'datePicker')).toHaveText(`Value: ${dttm}`);
}

async function datePickerTodayOnLoad(page: Page) {
  const today = await page.evaluate(() => new Date().toDateString());
  await expect(byId(page, 'datePickerDefault-label')).toContainText(today);
}

// SwatchColorPicker

async function swatchDefault(page: Page, color = 'orange') {
  await expect(byId(page, 'swatchColorPicker').locator(`[id*="fluentInputs-swatchColorPicker-${color}"]`)).toHaveAttribute(
    'aria-checked',
    'true',
  );
  await expect(output(page, 'swatchColorPicker')).toHaveText(`Value: ${color}`);
}

async function swatchChange(page: Page) {
  await byId(page, 'swatchColorPicker').locator('[id*="fluentInputs-swatchColorPicker-blueMagenta"]').click();
  await swatchDefault(page, 'blueMagenta');
}

// Toggle

const toggle = (page: Page) => page.locator('button#fluentInputs-toggle');

async function toggleDefault(page: Page, on = true) {
  await expect(toggle(page)).toHaveAttribute('aria-checked', String(on));
  await expect(output(page, 'toggle')).toHaveText(`Value: ${on ? 'TRUE' : 'FALSE'}`);
}

async function toggleChange(page: Page) {
  await toggle(page).click();
  await toggleDefault(page, false);
}

// SearchBox

async function searchBoxDefault(page: Page, value = '', placeholder = 'Search') {
  await expect(byId(page, 'searchBox')).toHaveValue(value);
  await expect(byId(page, 'searchBox')).toHaveAttribute('placeholder', placeholder);
  await expect(output(page, 'searchBox')).toHaveText(`Value: ${value}`);
}

async function searchBoxChange(page: Page, text = 'some text') {
  await byId(page, 'searchBox').fill(text);
  await expect(byId(page, 'searchBox')).toHaveValue(text);
  await expect(output(page, 'searchBox')).toHaveText(`Value: ${text}`);
}

async function searchBoxClear(page: Page) {
  await searchBoxChange(page, 'query');
  await page.locator('#fluentInputs-panelFluent .ms-SearchBox-clearButton button[class*=ms-Button]').click();
  await expect(byId(page, 'searchBox')).toHaveValue('');
  await expect(output(page, 'searchBox')).toHaveText('Value:');
}

test.describe('Slider.shinyInput()', () => {
  test('setting default values works', async ({ page }) => sliderDefault(page));
  test('value change works', async ({ page }) => sliderChange(page));
});

test.describe('TextField.shinyInput()', () => {
  test('setting default values works', async ({ page }) => textFieldDefault(page));
  test('value change works', async ({ page }) => textFieldChange(page));
});

test.describe('Checkbox.shinyInput()', () => {
  test('setting default values works', async ({ page }) => checkboxChecked(page, false));
  test('value change works', async ({ page }) => checkboxChange(page));
});

test.describe('Rating.shinyInput()', () => {
  test('setting default values works', async ({ page }) => ratingDefault(page));
  test('value change works', async ({ page }) => ratingChange(page));
});

test.describe('SpinButton.shinyInput()', () => {
  test('setting default values works', async ({ page }) => spinButtonDefault(page));
  test('value change by using buttons works', async ({ page }) => spinButtonArrows(page));
  test('value change by typing works', async ({ page }) => spinButtonType(page));
});

test.describe('Calendar.shinyInput()', () => {
  test('setting default values works', async ({ page }) => {
    await calendarTodayOnLoad(page);
    await calendarDefault(page);
  });
});

test.describe('ChoiceGroup.shinyInput()', () => {
  test('setting default values works', async ({ page }) => choiceGroupDefault(page));
  test('value change works', async ({ page }) => choiceGroupChange(page));
});

test.describe('ColorPicker.shinyInput()', () => {
  test('setting default values works', async ({ page }) => colorPickerDefault(page));
  test('value change by using hex input field works', async ({ page }) => colorPickerChange(page));
});

test.describe('ComboBox.shinyInput()', () => {
  test('setting default values works', async ({ page }) => comboBoxDefault(page));
  test('value change works', async ({ page }) => comboBoxChange(page));
});

test.describe('Dropdown.shinyInput()', () => {
  test('setting default values works', async ({ page }) => dropdownDefault(page));
  test('value change works', async ({ page }) => {
    await dropdownDefault(page);
    await dropdownChange(page);
  });
  test('setting default values for multiSelect works', async ({ page }) => multiselectDefault(page));
  test('changing multiSelect values works', async ({ page }) => {
    await multiselectDefault(page);
    await multiselectChange(page);
  });
});

test.describe('DatePicker.shinyInput()', () => {
  test('setting default values works', async ({ page }) => {
    await datePickerTodayOnLoad(page);
    await datePickerDefault(page);
  });
});

test.describe('SwatchColorPicker.shinyInput()', () => {
  test('setting default values works', async ({ page }) => swatchDefault(page));
  test('value change works', async ({ page }) => swatchChange(page));
});

test.describe('Toggle.shinyInput()', () => {
  test('setting default values works', async ({ page }) => toggleDefault(page));
  test('value change works', async ({ page }) => toggleChange(page));
});

test.describe('SearchBox.shinyInput()', () => {
  test('setting default values works', async ({ page }) => searchBoxDefault(page));
  test('value change works', async ({ page }) => searchBoxChange(page));
  test('clear query button works', async ({ page }) => searchBoxClear(page));
});

test.describe('reset after toggled visibility', () => {
  const cases: [string, (page: Page) => Promise<void>, (page: Page) => Promise<void>][] = [
    ['Slider', sliderChange, (p) => sliderDefault(p)],
    ['TextField', (p) => textFieldChange(p), (p) => textFieldDefault(p)],
    ['Checkbox', checkboxChange, (p) => checkboxChecked(p, false)],
    ['Rating', (p) => ratingChange(p), (p) => ratingDefault(p)],
    ['SpinButton', (p) => spinButtonType(p), (p) => spinButtonDefault(p)],
    // The Cypress spec only re-checked the defaults for ChoiceGroup and SearchBox; these change them first.
    ['ChoiceGroup', choiceGroupChange, (p) => choiceGroupDefault(p)],
    ['ColorPicker', (p) => colorPickerChange(p), (p) => colorPickerDefault(p)],
    ['ComboBox', comboBoxChange, (p) => comboBoxDefault(p)],
    [
      'Dropdown',
      async (p) => {
        await dropdownChange(p);
        await multiselectChange(p);
      },
      async (p) => {
        await dropdownDefault(p);
        await multiselectDefault(p);
      },
    ],
    ['SwatchColorPicker', swatchChange, (p) => swatchDefault(p)],
    ['Toggle', toggleChange, (p) => toggleDefault(p)],
    ['SearchBox', (p) => searchBoxChange(p), (p) => searchBoxDefault(p)],
  ];
  for (const [name, change, expectDefault] of cases) {
    test(`${name}.shinyInput()`, async ({ page }) => {
      await change(page);
      await toggleVisibility(page);
      await expectDefault(page);
    });
  }
});

test.describe('update from the server', () => {
  const cases: [string, (page: Page) => Promise<void>, (page: Page) => Promise<void>][] = [
    ['Slider', (p) => sliderDefault(p), (p) => sliderDefault(p, 100)],
    ['TextField', (p) => textFieldDefault(p), (p) => textFieldDefault(p, 'new text')],
    ['Checkbox', (p) => checkboxChecked(p, false), (p) => checkboxChecked(p, true)],
    ['Rating', (p) => ratingDefault(p), (p) => ratingDefault(p, 5)],
    ['SpinButton', (p) => spinButtonDefault(p), (p) => spinButtonDefault(p, 40)],
    ['Calendar', (p) => calendarDefault(p), (p) => calendarDefault(p, '25, June, 2015', '2015-06-25T12:00:00.000Z')],
    ['ChoiceGroup', (p) => choiceGroupDefault(p), (p) => choiceGroupDefault(p, 'C')],
    ['ColorPicker', (p) => colorPickerDefault(p), (p) => colorPickerDefault(p, 'ffffff')],
    ['ComboBox', (p) => comboBoxDefault(p), (p) => comboBoxDefault(p, 'Option B', 'B')],
    ['Dropdown', (p) => dropdownDefault(p), (p) => dropdownDefault(p, 'Option C', 'C')],
    [
      'Dropdown (multiSelect, new options)',
      (p) => multiselectDefault(p),
      (p) => multiselectDefault(p, 'Option X, Option Z', 'Value: X Value: Z'),
    ],
    [
      'DatePicker',
      (p) => datePickerDefault(p),
      (p) => datePickerDefault(p, 'Thu Jun 25 2015', '2015-06-25T12:00:00.000Z'),
    ],
    ['SwatchColorPicker', (p) => swatchDefault(p), (p) => swatchDefault(p, 'white')],
    ['Toggle', (p) => toggleDefault(p), (p) => toggleDefault(p, false)],
    ['SearchBox', (p) => searchBoxDefault(p), (p) => searchBoxDefault(p, 'query')],
  ];
  for (const [name, before, after] of cases) {
    test(`${name}.shinyInput()`, async ({ page }) => {
      await before(page);
      await clickUpdate(page);
      await after(page);
    });
  }
});
