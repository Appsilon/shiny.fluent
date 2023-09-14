function toggleVisibility() {
  cy.get('#fluentInputs-toggleInputs').click();
  cy.get('#fluentInputs-toggleInputs').click();
}

function textFieldDefaultTest(aText = '') {
  cy.get('#fluentInputs-textField').should('have.value', aText);
  cy.get('#fluentInputs-textFieldValue').should('contain', `Value: ${aText}`);
}

function textFieldChangeTest(aText = 'some text') {
  cy.get('#fluentInputs-textField').type(aText).should('have.value', aText);
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
    cy.get('[class*=ms-Slider-slideBox]')
      .should('have.attr', 'aria-valuenow', 0)
      .type('{rightarrow}')
      .should('have.attr', 'aria-valuenow', 118);
  });
  cy.get('#fluentInputs-sliderInputValue').should('contain', 'Value: 118');
}

function checkboxTestDefault(value = 'false') {
  cy.get('#fluentInputs-checkbox').should('have.attr', 'aria-checked', value);
  cy.get('#fluentInputs-checkboxValue').should('contain', `Value: ${value.toUpperCase()}`);
}

function checkboxTestChange(value = 'true') {
  cy.get('#fluentInputs-checkbox').click({ force: true });
  cy.get('#fluentInputs-checkbox').should('have.attr', 'aria-checked', value);
  cy.get('#fluentInputs-checkboxValue').should('contain', `Value: ${value.toUpperCase()}`);
}

function ratingTestDefault(value = 2) {
  cy.get('#fluentInputs-rating').within(() => {
    cy.get(`[id$=star-${value - 1}]`).should('have.attr', 'aria-checked', 'true');
  });
  cy.get('#fluentInputs-ratingValue').should('contain', `Value: ${value}`);
}

function ratingChangeTest(value = 5) {
  cy.get('#fluentInputs-rating').within(() => {
    cy.get(`[id$=star-${value - 1}]`).click().should('have.attr', 'aria-checked', 'true');
  });
  cy.get('#fluentInputs-ratingValue').should('contain', `Value: ${value}`);
}

function spinButtonDefaultTest(now = 15, min = 0, max = 50) {
  cy.get('#fluentInputs-spinButton').within(() => {
    cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuenow', now);
    cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuemin', min);
    cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuemax', max);
  });
  cy.get('#fluentInputs-spinButtonValue').should('contain', `Value: ${now}`);
}

function spinButtonChangeTest(now = 50) {
  cy.get('#fluentInputs-spinButton').within(() => {
    cy.get('.ms-spinButton-input').type(now).should('have.attr', 'value', now);
  });
  cy.get('#fluentInputs-spinButtonValue').click().should('contain', `Value: ${now}`);
}

function spinButtonChangeButtonsTest() {
  cy.get('#fluentInputs-spinButton').within(() => {
    cy.get('[class*=ms-Button][class*=ms-DownButton]').click();
    cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuenow', 10);
  });
  cy.get('#fluentInputs-spinButtonValue').should('contain', 'Value: 10');

  cy.get('#fluentInputs-spinButton').within(() => {
    cy.get('[class*=ms-Button][class*=ms-UpButton]').click().click();
    cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuenow', 20);
  });
  cy.get('#fluentInputs-spinButtonValue').should('contain', 'Value: 20');
}

function calendarDefaultTest(date = 'June 25, 2020', dttm = '2020-06-25T12:00:00.000Z') {
  cy.get('.ms-DatePicker.calendar').within(() => {
    cy.get(`button[aria-label="${date}"]`).should('have.attr', 'aria-selected', 'true');
  });
  cy.get('#fluentInputs-calendarValue').should('contain', `Value: ${dttm}`);
}

function calendarOnLoadTest() {
  const month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  const today = new Date();
  const date = `${month[today.getMonth()]} ${today.getDate()}, ${today.getFullYear()}`;

  cy.get('.ms-DatePicker.calendarDefault').within(() => {
    cy.get(`button[aria-label="${date}"]`).should('have.attr', 'aria-selected', 'true');
  });
  cy.get('.ms-DatePicker.calendarNull').within(() => {
    cy.get(`button[aria-label="${date}"]`).should('have.attr', 'aria-selected', 'true');
  });
}

function choiceGroupDefaultTest(selected = 'B') {
  cy.get('#fluentInputs-choiceGroup').within(() => {
    cy.get(`label[class^=ms-ChoiceField][class*=is-checked] > span[id^=ChoiceGroupLabel][id$=-${selected}]`)
      .should('exist');

    cy.get('input[id^=ChoiceGroup][id$=-A]').should('exist');
    cy.get('label[class^=ms-ChoiceField]').within(() => {
      cy.get('span[id^=ChoiceGroupLabel][id$=-A]').contains('Option A');
    });

    cy.get('input[id^=ChoiceGroup][id$=-B]').should('exist');
    cy.get('label[class^=ms-ChoiceField]').within(() => {
      cy.get('span[id^=ChoiceGroupLabel][id$=-B]').contains('Option B');
    });

    cy.get('input[id^=ChoiceGroup][id$=-C]').should('exist');
    cy.get('label[class^=ms-ChoiceField]').within(() => {
      cy.get('span[id^=ChoiceGroupLabel][id$=-C]').contains('Option C');
    });
  });
  cy.get('#fluentInputs-choiceGroupValue').should('contain', `Value: ${selected}`);
}

function choiceGroupChangeTest() {
  cy.get('#fluentInputs-choiceGroup').within(() => {
    cy.get('label[class^=ms-ChoiceField][for*=-C]').click().should('have.class', 'is-checked');
  });
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
  cy.get('.ms-ColorPicker').within(() => {
    cy.get('input[id*="TextField"][aria-label="Hex"]').click().clear().type(color);
  });
  const hexColor = `#${color}`;
  cy.get('#fluentInputs-colorPickerValue').should('contain', `Value: ${hexColor}`);
}

function comboBoxDefaultTest(value = 'some text', output = value) {
  cy.get('#fluentInputs-comboBox').within(() => {
    cy.get('#fluentInputs-comboBox-input').should('have.attr', 'value', value);
  });
  cy.get('#fluentInputs-comboBoxValue').contains(`Value: ${output}`);
}

function comboBoxChangeTest() {
  cy.get('#fluentInputs-comboBox').within(() => {
    cy.get('button[class*=ms-Button][class*=ms-ComboBox-CaretDown-button]').click();
  });
  cy.get('[id*="fluentInputs-comboBox-list0"]').click();
  cy.get('#fluentInputs-comboBoxValue').contains('Value: A');
}

function dropdownDefaultTest(value = 'Option A', output = 'A') {
  cy.get('#fluentInputs-dropdown').within(() => {
    cy.get('#fluentInputs-dropdown-option')
      .should('have.attr', 'aria-selected', 'true').should('contain', `${value}`);
  });
  cy.get('#fluentInputs-dropdownValue').should('contain', `Value: ${output}`);
}

function dropdownChangeTest() {
  cy.get('#fluentInputs-dropdown-option').click();
  cy.get('#fluentInputs-dropdown-list2').click();
  cy.get('#fluentInputs-dropdown-option').should('have.attr', 'aria-selected', 'true').should('contain', 'Option C');
  cy.get('#fluentInputs-dropdownValue').contains('Value: C');
}

function dropdownMultiselectDefaultTest(value = 'Option A, Option C', output = 'Value: A Value: C') {
  cy.get('#fluentInputs-dropdownMultiselect').within(() => {
    cy.get('#fluentInputs-dropdownMultiselect-option').should('contain', `${value}`);
  });
  cy.get('#fluentInputs-dropdownMultiselectValue').should('contain', `${output}`);
}

function dropdownMultiselectChangeTest() {
  cy.get('#fluentInputs-dropdownMultiselect-option').click();
  cy.get('#fluentInputs-dropdownMultiselect-list0').parent().click();
  cy.get('#fluentInputs-dropdownMultiselect-list1').parent().click();
  cy.get('#fluentInputs-dropdownMultiselect-option').should('contain', 'Option C, Option B');
  cy.get('#fluentInputs-dropdownMultiselectValue').contains('Value: C Value: B');
}

function datePickerDefaultTest(date = 'Thu Jun 25 2020', dttm = '2020-06-25T12:00:00.000Z') {
  cy.get('#fluentInputs-datePicker-label').should('have.attr', 'value', date);
  cy.get('#fluentInputs-datePickerValue').should('contain', `Value: ${dttm}`);
}

function datePickerOnLoadTest() {
  const date = (new Date()).toDateString();

  cy.get('#fluentInputs-datePickerDefault-label').should('have.attr', 'value', date);
  cy.get('#fluentInputs-datePickerNull-label').should('have.attr', 'placeholder', 'I am placeholder!');
}

function swatchColorPickerDefaultTest(color = 'orange', pos = 0) {
  cy.get('#fluentInputs-swatchColorPicker').within(() => {
    cy.get(`#fluentInputs-swatchColorPicker-${color}-${pos}`).should('have.attr', 'aria-selected', 'true');
  });
  cy.get('#fluentInputs-swatchColorPickerValue').should('contain', `Value: ${color}`);
}

function swatchColorPickerChangeTest() {
  cy.get('#fluentInputs-swatchColorPicker').within(() => {
    cy.get('button[id*="fluentInputs-swatchColorPicker-blueMagenta"]').click();
  });
  cy.get('#fluentInputs-swatchColorPickerValue').should('contain', 'Value: blueMagenta');
}

function toggleDefaultTest(value = 'true') {
  cy.get('button#fluentInputs-toggle').should('have.attr', 'aria-checked', value);
  cy.get('#fluentInputs-toggleValue').should('contain', `Value: ${value.toUpperCase()}`);
}

function toggleChangeTest(value = 'false') {
  cy.get('button#fluentInputs-toggle').click().should('have.attr', 'aria-checked', value);
  cy.get('#fluentInputs-toggleValue').should('contain', `Value: ${value.toUpperCase()}`);
}

function searchBoxDefaultTest(value = '', placeholder = 'Search') {
  cy.get('#fluentInputs-searchBox').should('have.value', value);
  cy.get('#fluentInputs-searchBox').should('have.attr', 'placeholder', placeholder);
}

function searchBoxChangeTest() {
  const aText = 'some text';
  cy.get('#fluentInputs-searchBox').type(aText).should('have.value', aText);
  cy.get('#fluentInputs-searchBoxValue').should('contain', `Value: ${aText}`);
}

function searchBoxClearTest(value = '') {
  cy.get('#fluentInputs-searchBox').type('query');
  cy.get('.ms-SearchBox-clearButton').within(() => {
    cy.get('button[class*=ms-Button]').click();
  });
  cy.get('#fluentInputs-searchBox').should('have.attr', 'value', value);
  cy.get('#fluentInputs-searchBoxValue').should('contain', `Value:${value}`);
}

describe('Slider.shinyInput()', () => {
  before(() => {
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
  it('setting default values works', () => {
    textFieldDefaultTest();
  });

  it('value change works', () => {
    textFieldChangeTest();
  });
});

describe('Checkbox.shinyInput()', () => {
  it('setting default values works', () => {
    checkboxTestDefault();
  });

  it('value change works', () => {
    checkboxTestChange();
  });
});

describe('Rating.shinyInput()', () => {
  it('setting default values works', () => {
    ratingTestDefault();
  });

  it('value change works', () => {
    ratingChangeTest();
  });
});

describe('SpinButton.shinyInput()', () => {
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
  it('setting default values works', () => {
    calendarOnLoadTest();
    calendarDefaultTest();
  });
});

describe('ChoiceGroup.shinyInput()', () => {
  it('setting default values works', () => {
    choiceGroupDefaultTest();
  });

  it('value change works', () => {
    choiceGroupChangeTest();
  });
});

describe('ColorPicker.shinyInput()', () => {
  it('setting default values works', () => {
    colorPickerDefaultTest();
  });

  it('value change by using hex input field works', () => {
    colorPickerHexChangeTest('ffffff');
  });
});

describe('ComboBox.shinyInput()', () => {
  it('setting default values works', () => {
    comboBoxDefaultTest();
  });

  it('value change works', () => {
    comboBoxChangeTest();
  });
});

describe('Dropdown.shinyInput()', () => {
  it('setting default values works', () => {
    dropdownDefaultTest();
  });

  it('value change works', () => {
    dropdownChangeTest();
  });

  it('setting default values for multiSelect works', () => {
    dropdownMultiselectDefaultTest();
  });

  it('updating multiSelect options and values works', () => {
    dropdownMultiselectChangeTest();
  });
});

describe('DatePicker.shinyInput()', () => {
  it('setting default values works', () => {
    datePickerOnLoadTest();
    datePickerDefaultTest();
  });
});

describe('SwatchColorPicker.shinyInput()', () => {
  it('setting default values works', () => {
    swatchColorPickerDefaultTest();
  });

  it('value change works', () => {
    swatchColorPickerChangeTest();
  });
});

describe('Toggle.shinyInput()', () => {
  it('setting default values works', () => {
    toggleDefaultTest();
  });

  it('value change works', () => {
    toggleChangeTest();
  });
});

describe('SearchBox.shinyInput()', () => {
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
  before(() => {
    cy.reload();
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
    checkboxTestDefault();
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
    dropdownChangeTest();
    toggleVisibility();
    dropdownDefaultTest();
    dropdownMultiselectChangeTest();
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
  before(() => {
    cy.get('#fluentInputs-updateInputs').click();
  });

  it('Slider.shinyInput() works', () => {
    sliderDefaultTest(100, -100, 234);
  });

  it('TextField.shinyInput() works', () => {
    textFieldDefaultTest('new text');
  });

  it('Checkbox.shinyInput() works', () => {
    checkboxTestDefault('true');
  });

  it('Rating.shinyInput() works', () => {
    ratingTestDefault(5);
  });

  it('SpinButton.shinyInput() works', () => {
    spinButtonDefaultTest(40);
  });

  it('Calendar.shinyInput() works', () => {
    calendarDefaultTest('June 25, 2015', '2015-06-25T12:00:00.000Z');
  });

  it('ChoiceGroup.shinyInput() works', () => {
    choiceGroupDefaultTest('C');
  });

  it('ColorPicker.shinyInput() works', () => {
    colorPickerDefaultTest('ffffff');
  });

  it('ComboBox.shinyInput() works', () => {
    comboBoxDefaultTest('Option C', 'C');
  });

  it('Dropdown.shinyInput() works', () => {
    dropdownDefaultTest('Option C', 'C');
  });

  it('Dropdown.shinyInput() works for multiSelects', () => {
    dropdownMultiselectDefaultTest('Option X, Option Z', 'Value: X Value: Z');
  });

  it('DatePicker.shinyInput() works', () => {
    datePickerDefaultTest('Thu Jun 25 2015', '2015-06-25T12:00:00.000Z');
  });

  it('SwatchColorPicker.shinyInput() works', () => {
    swatchColorPickerDefaultTest('white', 4);
  });

  it('Toggle.shinyInput()', () => {
    toggleDefaultTest('false');
  });

  it('SearchBox.shinyInput()', () => {
    searchBoxDefaultTest('query');
  });
});
