function toggleVisibility() {
  cy.get('#fluentInputs-toggleInputs').click();
  cy.get('#fluentInputs-toggleInputs').click();
}

function textFieldTestDefault(aText = '') {
  cy.get('#fluentInputs-textField').should('have.value', aText);
  cy.get('#fluentInputs-textFieldValue').should('contain', `Value: ${aText}`);
}

function textFieldTestChange(aText = 'some text') {
  cy.get('#fluentInputs-textField').type(aText).should('have.value', aText);
  cy.get('#fluentInputs-textFieldValue').should('contain', `Value: ${aText}`);
}

function sliderTestDefault(now = 0, min = -100, max = 234) {
  cy.get('.ms-Slider').within(() => {
    cy.get('[class*=ms-Slider-slideBox]').should('have.attr', 'aria-valuenow', now);
    cy.get('[class*=ms-Slider-slideBox]').should('have.attr', 'aria-valuemin', min);
    cy.get('[class*=ms-Slider-slideBox]').should('have.attr', 'aria-valuemax', max);
  });
  cy.get('#fluentInputs-sliderInputValue').should('contain', `Value: ${now}`);
}

function checkboxTestDefault() {
  cy.get('#fluentInputs-checkbox').should('have.attr', 'aria-checked', 'false');
  cy.get('#fluentInputs-checkboxValue').should('contain', 'Value: FALSE');
}

function checkboxTestChange() {
  cy.get('#fluentInputs-checkbox').should('have.attr', 'aria-checked', 'false');
  cy.get('#fluentInputs-checkboxValue').should('contain', 'Value: FALSE');
}

function ratingTestDefault(value = 2) {
  cy.get('#fluentInputs-rating').within(() => {
    cy.get(`[id$=star-${value - 1}]`).should('have.attr', 'aria-checked', 'true');
  });
  cy.get('#fluentInputs-ratingValue').should('contain', `Value: ${value}`);
}

function spinButtonDefault(now = 15, min = 0, max = 50) {
  cy.get('#fluentInputs-spinButton').within(() => {
    cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuenow', now);
    cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuemin', min);
    cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuemax', max);
  });
  cy.get('#fluentInputs-spinButtonValue').should('contain', `Value: ${now}`);
}

function calendarDefaultTest() {
  cy.get('.ms-DatePicker').within(() => {
    cy.get('button[aria-label="June 25, 2020"]').should('have.attr', 'aria-selected', 'true');
  });
  cy.get('#fluentInputs-calendarValue').should('contain', 'Value: 2020-06-25T12:00:00.000Z');
}

function choiceGroupDefaultTest() {
  cy.get('input[id^=ChoiceGroup][id$=-B]').should('exist');
  cy.get('label[class^=ms-ChoiceField][class*=is-checked]').within(() => {
    cy.get('span[id^=ChoiceGroupLabel][id$=-B]').contains('Option B');
  });
  cy.get('#fluentInputs-choiceGroupValue').should('contain', 'Value: B');

  cy.get('#fluentInputs-choiceGroup').within(() => {
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
}

function colorPickerDefaultTest() {
  cy.get('#fluentInputs-colorPickerValue').should('contain', 'Value: #00FF01');
}

function spinButtonDefaultTest() {
  cy.get('#fluentInputs-comboBox').within(() => {
    cy.get('#fluentInputs-comboBox-input').should('have.attr', 'value', 'some text');
  });
  cy.get('#fluentInputs-comboBoxValue').contains('some text');
}

function spinButtonChangeTest() {
  cy.get('#fluentInputs-comboBox').within(() => {
    cy.get('button[class*=ms-Button][class*=ms-ComboBox-CaretDown-button]').click();
  });
  cy.get('[id*="fluentInputs-comboBox-list0"]').click();
  cy.get('#fluentInputs-comboBoxValue').contains('Value: A');
}

function dropdownDefaultTest() {
  cy.get('#fluentInputs-dropdown').within(() => {
    cy.get('#fluentInputs-dropdown-option')
      .should('have.attr', 'aria-selected', 'true').should('contain', 'Option A');
  });
  cy.get('#fluentInputs-dropdownValue').should('contain', 'Value: A');
}

function datePickerDefaultTest() {
  cy.get('#fluentInputs-datePickerValue').should('contain', 'Value: 2020-06-25T12:00:00.000Z');
}

function swatchColorPickerDefaultTest() {
  cy.get('#fluentInputs-swatchColorPicker').within(() => {
    cy.get('#fluentInputs-swatchColorPicker-orange-0').should('have.attr', 'aria-selected', 'true');
  });
  cy.get('#fluentInputs-swatchColorPickerValue').should('contain', 'Value: orange');
}

function swatchColorPickerChangeTest() {
  cy.get('#fluentInputs-swatchColorPicker').within(() => {
    cy.get('button[id*="fluentInputs-swatchColorPicker-blueMagenta"]').click();
  });
  cy.get('#fluentInputs-swatchColorPickerValue').should('contain', 'Value: blueMagenta');
}

function toggleDefaultTest() {
  cy.get('button#fluentInputs-toggle').should('have.attr', 'aria-checked', 'true');
  cy.get('#fluentInputs-toggleValue').should('contain', 'Value: TRUE');
}

function toggleChangeTest() {
  cy.get('button#fluentInputs-toggle').click().should('have.attr', 'aria-checked', 'false');
  cy.get('#fluentInputs-toggleValue').should('contain', 'Value: FALSE');
}

function searchBoxDefaultTest() {
  cy.get('#fluentInputs-searchBox').should('have.value', '');
  cy.get('#fluentInputs-searchBox').should('have.attr', 'placeholder', 'Search');
}

function searchBoxChangeTest() {
  const aText = 'some text';
  cy.get('#fluentInputs-searchBox').type(aText).should('have.value', aText);
  cy.get('#fluentInputs-searchBoxValue').should('contain', `Value: ${aText}`);
}

function searchBoxClearTest() {
  cy.get('#fluentInputs-searchBox').type('query');
  cy.get('.ms-SearchBox-clearButton').within(() => {
    cy.get('button[class*=ms-Button]').click();
  });
  cy.get('#fluentInputs-searchBox').should('have.attr', 'value', '');
  cy.get('#fluentInputs-searchBoxValue').should('contain', 'Value:');
}

describe('Slider.shinyInput()', () => {
  before(() => {
    cy.visit('/');
  });

  it('setting default values works', () => {
    sliderTestDefault();
  });
});

describe('TextField.shinyInput()', () => {
  it('setting default values works', () => {
    textFieldTestDefault();
  });

  it('change works', () => {
    textFieldTestChange();
  });
});

describe('Checkbox.shinyInput()', () => {
  it('setting default values works', () => {
    checkboxTestDefault();
  });

  it('change works', () => {
    checkboxTestChange();
  });
});

describe('Rating.shinyInput()', () => {
  it('setting default values works', () => {
    ratingTestDefault();
  });
});

describe('SpinButton.shinyInput()', () => {
  it('setting default values works', () => {
    spinButtonDefault();
  });
});

describe('Calendar.shinyInput()', () => {
  it('setting default values works', () => {
    calendarDefaultTest();
  });
});

describe('ChoiceGroup.shinyInput()', () => {
  it('setting default values works', () => {
    choiceGroupDefaultTest();
  });
});

describe('ColorPicker.shinyInput()', () => {
  it('setting default values works', () => {
    colorPickerDefaultTest();
  });
});

describe('SpinButton.shinyInput()', () => {
  it('setting default values works', () => {
    spinButtonDefaultTest();
  });

  it('selecting options works', () => {
    spinButtonChangeTest();
  });
});

describe('Dropdown.shinyInput()', () => {
  it('setting default values works', () => {
    dropdownDefaultTest();
  });
});

describe('DatePicker.shinyInput()', () => {
  it('setting default values works', () => {
    datePickerDefaultTest();
  });
});

describe('SwatchColorPicker.shinyInput()', () => {
  it('setting default values works', () => {
    swatchColorPickerDefaultTest();
  });

  it('change works', () => {
    swatchColorPickerChangeTest();
  });
});

describe('Toggle.shinyInput()', () => {
  it('setting default values works', () => {
    toggleDefaultTest();
  });

  it('change works', () => {
    toggleChangeTest();
  });
});

describe('SearchBox.shinyInput()', () => {
  it('setting default values works', () => {
    searchBoxDefaultTest();
  });

  it('change works', () => {
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

  it('TextField.shinyInput() works', () => {
    textFieldTestChange();
    toggleVisibility();
    textFieldTestDefault();
  });

  it('Checkbox.shinyInput() works', () => {
    checkboxTestChange();
    toggleVisibility();
    checkboxTestDefault();
  });

  it('SpinButton.shinyInput() works', () => {
    spinButtonChangeTest();
    toggleVisibility();
    spinButtonDefaultTest();
  });

  it('swatchColorPicker.shinyInput() works', () => {
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
    sliderTestDefault(100, -100, 234);
  });

  it('TextField.shinyInput() works', () => {
    textFieldTestDefault('new text');
  });

  it('Checkbox.shinyInput() works', () => {
    textFieldTestDefault('new text');
  });
});
