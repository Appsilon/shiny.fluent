function toggleVisibility() {
  cy.get('#fluentInputs-toggleInputs').click();
  cy.get('#fluentInputs-toggleInputs').click();
}

function textFieldDefaultTest(aText = '') {
  cy.get('#fluentInputs-textField').should('have.value', aText);
  cy.get('#fluentInputs-textFieldValue').should('contain', `Value: ${aText}`);
}

function textFieldChangeTest(aText = 'some text') {
  cy.get('#fluentInputs-textField').type(aText);
  cy.get('#fluentInputs-textField').should('have.value', aText);
  cy.get('#fluentInputs-textFieldValue').should('contain', `Value: ${aText}`);
}

function sliderDefaultTest(now = 0, min = -100, max = 234) {
  cy.get('.ms-Slider').within(() => {
    cy.get('[class*=ms-Slider-slideBox]').should('have.attr', 'aria-valuenow', now);
    cy.get('[class*=ms-Slider-slideBox]').should('have.attr', 'aria-valuemin', min);
    cy.get('[class*=ms-Slider-slideBox]').should('have.attr', 'aria-valuemax', max);
  });
  cy.get('#fluentInputs-sliderInputValue').should('contain', `Value: ${now}`);
}

function sliderChangeTest() {
  cy.get('.ms-Slider').within(() => {
    cy.get('[class*=ms-Slider-slideBox]').should('have.attr', 'aria-valuenow', 0);
    cy.get('[class*=ms-Slider-slideBox]').type('{rightarrow}');
    cy.get('[class*=ms-Slider-slideBox]').should('have.attr', 'aria-valuenow', 118);
  });
  cy.get('#fluentInputs-sliderInputValue').should('contain', 'Value: 118');
}

function checkboxTestNotChecked() {
  cy.get('#fluentInputs-checkbox').should('not.be.checked');
  cy.get('#fluentInputs-checkboxValue').should('contain', 'Value: FALSE');
}

function checkboxTestChecked() {
  cy.get('#fluentInputs-checkbox').should('be.checked');
  cy.get('#fluentInputs-checkboxValue').should('contain', 'Value: TRUE');
}

function checkboxTestChange() {
  cy.get('#fluentInputs-checkbox').click({ force: true });
  cy.get('#fluentInputs-checkbox').should('be.checked');
  cy.get('#fluentInputs-checkboxValue').should('contain', 'Value: TRUE');
}

function ratingTestDefault(value = 2) {
  cy.get('#fluentInputs-rating').within(() => {
    cy.get(`[id$=star-${value - 1}]`).should('have.attr', 'aria-checked', 'true');
  });
  cy.get('#fluentInputs-ratingValue').should('contain', `Value: ${value}`);
}

function ratingChangeTest(value = 5) {
  cy.get(`#fluentInputs-rating [id$=star-${value - 1}]`).click();
  cy.get(`#fluentInputs-rating [id$=star-${value - 1}]`).should('have.attr', 'aria-checked', 'true');
  cy.get('#fluentInputs-ratingValue').should('contain', `Value: ${value}`);
}

function spinButtonDefaultTest(now = 15, min = 0, max = 50) {
  cy.get('#fluentInputs-spinButton .ms-spinButton-input').should('have.attr', 'aria-valuenow', now);
  cy.get('#fluentInputs-spinButton .ms-spinButton-input').should('have.attr', 'aria-valuemin', min);
  cy.get('#fluentInputs-spinButton .ms-spinButton-input').should('have.attr', 'aria-valuemax', max);
  cy.get('#fluentInputs-spinButtonValue').should('contain', `Value: ${now}`);
}

function spinButtonChangeTest(now = 50) {
  cy.get('#fluentInputs-spinButton .ms-spinButton-input').type(now);
  cy.get('#fluentInputs-spinButton .ms-spinButton-input').should('have.attr', 'value', now);
  cy.get('#fluentInputs-spinButtonValue').click();
  cy.get('#fluentInputs-spinButtonValue').should('contain', `Value: ${now}`);
}

function spinButtonChangeButtonsTest() {
  cy.get('#fluentInputs-spinButton [class*=ms-Button][class*=ms-DownButton]').click();
  cy.get('#fluentInputs-spinButton .ms-spinButton-input').should('have.attr', 'aria-valuenow', 10);
  cy.get('#fluentInputs-spinButtonValue').should('contain', 'Value: 10');
  cy.get('#fluentInputs-spinButton [class*=ms-Button][class*=ms-UpButton]').click();
  cy.get('#fluentInputs-spinButton [class*=ms-Button][class*=ms-UpButton]').click();
  cy.get('#fluentInputs-spinButton .ms-spinButton-input').should('have.attr', 'aria-valuenow', 20);
  cy.get('#fluentInputs-spinButtonValue').should('contain', 'Value: 20');
}

function calendarDefaultTest(date = '25, June, 2020', dttm = '2020-06-25T12:00:00.000Z') {
  cy.get(`#fluentInputs-calendar [aria-label="${date}"]`)
    .parent()
    .should('have.attr', 'aria-selected', 'true');
  cy.get('#fluentInputs-calendarValue').should('contain', `Value: ${dttm}`);
}

function calendarOnLoadTest() {
  cy.get('#fluentInputs-calendarDefault .ms-CalendarDay-dayIsToday')
    .parent()
    .should('have.attr', 'aria-selected', 'true');

  cy.get('#fluentInputs-calendarNull .ms-CalendarDay-dayIsToday')
    .parent()
    .should('have.attr', 'aria-selected', 'true');
}

function choiceGroupDefaultTest(selected = 'B') {
  cy.get('#fluentInputs-choiceGroup').within(() => {
    cy.get(`label[class^=ms-ChoiceField][class*=is-checked] > span[id^=ChoiceGroupLabel][id$=-${selected}]`)
      .should('exist');

    cy.get('input[id^=ChoiceGroup][id$=-A]').should('exist');
    cy.get('label[class^=ms-ChoiceField] span[id^=ChoiceGroupLabel][id$=-A]').contains('Option A');

    cy.get('input[id^=ChoiceGroup][id$=-B]').should('exist');
    cy.get('label[class^=ms-ChoiceField] span[id^=ChoiceGroupLabel][id$=-B]').contains('Option B');

    cy.get('input[id^=ChoiceGroup][id$=-C]').should('exist');
    cy.get('label[class^=ms-ChoiceField] span[id^=ChoiceGroupLabel][id$=-C]').contains('Option C');
  });
  cy.get('#fluentInputs-choiceGroupValue').should('contain', `Value: ${selected}`);
}

function choiceGroupChangeTest() {
  cy.get('#fluentInputs-choiceGroup label[class^=ms-ChoiceField][for*=-C]').click();
  cy.get('#fluentInputs-choiceGroup label[class^=ms-ChoiceField][for*=-C]').should('have.class', 'is-checked');
  cy.get('#fluentInputs-choiceGroupValue').should('contain', 'Value: C');
}

function colorPickerDefaultTest(color = '00ff01') {
  cy.get('.ms-ColorPicker').within(() => {
    cy.get('input[aria-label="Hex"]').should('have.attr', 'value', color);
  });
  const hexColor = `#${color.toUpperCase()}`;
  cy.get('#fluentInputs-colorPickerValue').should('contain', `Value: ${hexColor}`);
}

function colorPickerHexChangeTest(color = 'fffff') {
  cy.get('.ms-ColorPicker input[id*="TextField"][aria-label="Hex"]').click();
  cy.get('.ms-ColorPicker input[id*="TextField"][aria-label="Hex"]').clear();
  cy.get('.ms-ColorPicker input[id*="TextField"][aria-label="Hex"]').type(color);
  const hexColor = `#${color}`;
  cy.get('#fluentInputs-colorPickerValue').should('contain', `Value: ${hexColor}`);
}

function comboBoxDefaultTest(value = 'some text', output = value) {
  cy.get('#fluentInputs-comboBox-input').should('have.attr', 'value', value);
  cy.get('#fluentInputs-comboBoxValue').contains(`Value: ${output}`);
}

function comboBoxChangeTest() {
  cy.get('#fluentInputs-comboBox-input + button').click();
  cy.get('#fluentInputs-comboBox-list');
  cy.get('#fluentInputs-comboBox-list0').click();
  cy.get('#fluentInputs-comboBoxValue').contains('Value: A');
}

function dropdownDefaultTest(value = 'Option A', output = 'A') {
  cy.get('#fluentInputs-dropdown-option').should('contain', `${value}`);
  cy.get('#fluentInputs-dropdownValue').should('contain', `Value: ${output}`);
}

function dropdownChangeTest() {
  cy.get('#fluentInputs-dropdown-option').click();
  cy.get('#fluentInputs-dropdown-list').should('be.visible');
  cy.get('#fluentInputs-dropdown-list2').click();
  cy.get('#fluentInputs-dropdown-option').should('contain', 'Option C');
  cy.get('#fluentInputs-dropdownValue').contains('Value: C');
}

function dropdownMultiselectDefaultTest(value = 'Option A, Option C', output = 'Value: A Value: C') {
  cy.get('#fluentInputs-dropdownMultiselect-option').should('contain', `${value}`);
  cy.get('#fluentInputs-dropdownMultiselectValue').should('contain', `${output}`);
}

function dropdownMultiselectChangeTest() {
  cy.get('#fluentInputs-dropdownMultiselect-option').click();
  cy.get('#fluentInputs-dropdownMultiselect-list').should('be.visible');
  cy.get('#fluentInputs-dropdownMultiselect-list0').parent().click();
  cy.get('#fluentInputs-dropdownMultiselect-list1').parent().click();
  cy.get('#fluentInputs-dropdownMultiselect-option').should('contain', 'Option C, Option B');
  cy.get('#fluentInputs-dropdownMultiselectValue').contains('Value: C Value: B');
}

function datePickerDefaultTest(date = 'Thu Jun 25 2020', dttm = '2020-06-25T12:00:00.000Z') {
  cy.get('#fluentInputs-datePicker-label').should('contain', date);
  cy.get('#fluentInputs-datePickerValue').should('contain', `Value: ${dttm}`);
}

function datePickerOnLoadTest() {
  const date = (new Date()).toDateString();
  cy.get('#fluentInputs-datePickerDefault-label').should('contain', date);
}

function swatchColorPickerDefaultTest(color = 'orange') {
  cy.get(`#fluentInputs-swatchColorPicker [id*="fluentInputs-swatchColorPicker-${color}"`)
    .should('have.attr', 'aria-checked', 'true');
  cy.get('#fluentInputs-swatchColorPickerValue').should('contain', `Value: ${color}`);
}

function swatchColorPickerChangeTest() {
  cy.get('#fluentInputs-swatchColorPicker [id*="fluentInputs-swatchColorPicker-blueMagenta"]').click();
  cy.get('#fluentInputs-swatchColorPickerValue').should('contain', 'Value: blueMagenta');
}

function toggleDefaultTest(value = 'true') {
  cy.get('button#fluentInputs-toggle').should('have.attr', 'aria-checked', value);
  cy.get('#fluentInputs-toggleValue').should('contain', `Value: ${value.toUpperCase()}`);
}

function toggleChangeTest(value = 'false') {
  cy.get('button#fluentInputs-toggle').click();
  cy.get('button#fluentInputs-toggle').should('have.attr', 'aria-checked', value);
  cy.get('#fluentInputs-toggleValue').should('contain', `Value: ${value.toUpperCase()}`);
}

function searchBoxDefaultTest(value = '', placeholder = 'Search') {
  cy.get('#fluentInputs-searchBox').should('have.value', value);
  cy.get('#fluentInputs-searchBox').should('have.attr', 'placeholder', placeholder);
}

function searchBoxChangeTest() {
  const aText = 'some text';
  cy.get('#fluentInputs-searchBox').type(aText);
  cy.get('#fluentInputs-searchBox').should('have.value', aText);
  cy.get('#fluentInputs-searchBoxValue').should('contain', `Value: ${aText}`);
}

function searchBoxClearTest(value = '') {
  cy.get('#fluentInputs-searchBox').type('query');
  cy.get('.ms-SearchBox-clearButton button[class*=ms-Button]').click();
  cy.get('#fluentInputs-searchBox').should('have.attr', 'value', value);
  cy.get('#fluentInputs-searchBoxValue').should('contain', `Value:${value}`);
}

describe('Slider.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    sliderDefaultTest();
  });

  it('value change works', () => {
    sliderChangeTest();
  });
});

describe('TextField.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    textFieldDefaultTest();
  });

  it('value change works', () => {
    textFieldChangeTest();
  });
});

describe('Checkbox.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    checkboxTestNotChecked();
  });

  it('value change works', () => {
    checkboxTestChange();
  });
});

describe('Rating.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    ratingTestDefault();
  });

  it('value change works', () => {
    ratingChangeTest();
  });
});

describe('SpinButton.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    spinButtonDefaultTest();
  });

  it('value change by using buttons works', () => {
    spinButtonChangeButtonsTest();
  });

  it('value change by typing works', () => {
    spinButtonChangeTest();
  });
});

describe('Calendar.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    calendarOnLoadTest();
    calendarDefaultTest();
  });
});

describe('ChoiceGroup.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    choiceGroupDefaultTest();
  });

  it('value change works', () => {
    choiceGroupChangeTest();
  });
});

describe('ColorPicker.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    colorPickerDefaultTest();
  });

  it('value change by using hex input field works', () => {
    colorPickerHexChangeTest('ffffff');
  });
});

describe('ComboBox.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    comboBoxDefaultTest();
  });

  it('value change works', () => {
    comboBoxChangeTest();
  });
});

describe('Dropdown.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    dropdownDefaultTest();
  });

  it('value change works', () => {
    dropdownDefaultTest();
    dropdownChangeTest();
  });

  it('setting default values for multiSelect works', () => {
    dropdownMultiselectDefaultTest();
  });

  it('updating multiSelect options and values works', () => {
    dropdownMultiselectDefaultTest();
    dropdownMultiselectChangeTest();
  });
});

describe('DatePicker.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    datePickerOnLoadTest();
    datePickerDefaultTest();
  });
});

describe('SwatchColorPicker.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    swatchColorPickerDefaultTest();
  });

  it('value change works', () => {
    swatchColorPickerChangeTest();
  });
});

describe('Toggle.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    toggleDefaultTest();
  });

  it('value change works', () => {
    toggleChangeTest();
  });
});

describe('SearchBox.shinyInput()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    searchBoxDefaultTest();
  });

  it('value change works', () => {
    searchBoxChangeTest();
  });

  it('clear query button works', () => {
    searchBoxClearTest();
  });
});

describe('Reset after toggled visibility', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('Slider.shinyInput() works', () => {
    sliderChangeTest();
    toggleVisibility();
    sliderDefaultTest();
  });

  it('TextField.shinyInput() works', () => {
    textFieldChangeTest();
    toggleVisibility();
    textFieldDefaultTest();
  });

  it('Checkbox.shinyInput() works', () => {
    checkboxTestChange();
    toggleVisibility();
    checkboxTestNotChecked();
  });

  it('Rating.shinyInput() works', () => {
    ratingChangeTest();
    toggleVisibility();
    ratingTestDefault();
  });

  it('SpinButton.shinyInput() works', () => {
    spinButtonChangeTest();
    toggleVisibility();
    spinButtonDefaultTest();
  });

  it('ChoiceGroup.shinyInput() works', () => {
    choiceGroupDefaultTest();
    toggleVisibility();
    choiceGroupDefaultTest();
  });

  it('ColorPicker.shinyInput() works', () => {
    colorPickerHexChangeTest('ffffff');
    toggleVisibility();
    colorPickerDefaultTest();
  });

  it('ComboBox.shinyInput() works', () => {
    comboBoxChangeTest();
    toggleVisibility();
    comboBoxDefaultTest();
  });

  it('Dropdown.shinyInput() works', () => {
    dropdownDefaultTest();
    dropdownMultiselectDefaultTest();
    dropdownChangeTest();
    dropdownMultiselectChangeTest();
    toggleVisibility();
    dropdownDefaultTest();
    dropdownMultiselectDefaultTest();
  });

  it('SwatchColorPicker.shinyInput() works', () => {
    swatchColorPickerChangeTest();
    toggleVisibility();
    swatchColorPickerDefaultTest();
  });

  it('Toggle.shinyInput()', () => {
    toggleChangeTest();
    toggleVisibility();
    toggleDefaultTest();
  });

  it('SearchBox.shinyInput()', () => {
    searchBoxDefaultTest();
    toggleVisibility();
    searchBoxDefaultTest();
  });
});

describe('Update from server works', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('Slider.shinyInput() works', () => {
    sliderDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    sliderDefaultTest(100, -100, 234);
  });

  it('TextField.shinyInput() works', () => {
    textFieldDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    textFieldDefaultTest('new text');
  });

  it('Checkbox.shinyInput() works', () => {
    checkboxTestNotChecked();
    cy.get('#fluentInputs-updateInputs').click();
    checkboxTestChecked();
  });

  it('Rating.shinyInput() works', () => {
    ratingTestDefault();
    cy.get('#fluentInputs-updateInputs').click();
    ratingTestDefault(5);
  });

  it('SpinButton.shinyInput() works', () => {
    spinButtonDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    spinButtonDefaultTest(40);
  });

  it('Calendar.shinyInput() works', () => {
    calendarDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    calendarDefaultTest('25, June, 2015', '2015-06-25T12:00:00.000Z');
  });

  it('ChoiceGroup.shinyInput() works', () => {
    choiceGroupDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    choiceGroupDefaultTest('C');
  });

  it('ColorPicker.shinyInput() works', () => {
    colorPickerDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    colorPickerDefaultTest('ffffff');
  });

  it('ComboBox.shinyInput() works', () => {
    comboBoxDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    comboBoxDefaultTest('Option B', 'B');
  });

  it('Dropdown.shinyInput() works', () => {
    dropdownDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    dropdownDefaultTest('Option C', 'C');
  });

  it('Dropdown.shinyInput() works for multiSelects', () => {
    dropdownMultiselectDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    dropdownMultiselectDefaultTest('Option X, Option Z', 'Value: X Value: Z');
  });

  it('DatePicker.shinyInput() works', () => {
    datePickerDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    datePickerDefaultTest('Thu Jun 25 2015', '2015-06-25T12:00:00.000Z');
  });

  it('SwatchColorPicker.shinyInput() works', () => {
    swatchColorPickerDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    swatchColorPickerDefaultTest('white', 4);
  });

  it('Toggle.shinyInput()', () => {
    toggleDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    toggleDefaultTest('false');
  });

  it('SearchBox.shinyInput()', () => {
    searchBoxDefaultTest();
    cy.get('#fluentInputs-updateInputs').click();
    searchBoxDefaultTest('query');
  });
});
