describe('Slider.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-sliderInputValue').should('contain', 'Value: 0');
  });
});

describe('TextField.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    const aText = 'some text';
    cy.get('#fluentInputs-textField').type(aText).should('have.value', aText);

    cy.get('#fluentInputs-textFieldValue').should('contain', `Value: ${aText}`);
  });
});

describe('Checkbox.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-checkbox').should('have.attr', 'aria-checked', 'false');

    cy.get('#fluentInputs-checkboxValue').should('contain', 'Value: FALSE');
  });
});

describe('Rating.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-rating').within(() => {
      cy.get('[id$=star-1]').should('have.attr', 'aria-checked', 'true');
    });
    cy.get('#fluentInputs-ratingValue').should('contain', 'Value: 2');
  });
});

describe('SpinButton.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-spinButton').within(() => {
      cy.get('.ms-spinButton-input').should('have.attr', 'aria-valuenow', 15);
    });
    cy.get('#fluentInputs-spinButtonValue').should('contain', 'Value: 15');
  });
});

describe('Calendar.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-calendarValue').should('contain', 'Value: 2020-06-25T22:00:00.000Z');
  });
});

describe('ChoiceGroup.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-choiceGroupValue').should('contain', 'Value: B');
  });
});

describe('ColorPicker.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-colorPickerValue').should('contain', 'Value: #00FF01');
  });
});

describe('ComboBox.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-comboBox').within(() => {
      cy.get('#fluentInputs-comboBox-input').should('have.attr', 'value', 'some text');
    });
  });
});

describe('Dropdown.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-dropdown').within(() => {
      cy.get('#fluentInputs-dropdown-option')
        .should('have.attr', 'aria-selected', 'true').should('contain', 'Option A');
    });
    cy.get('#fluentInputs-dropdownValue').should('contain', 'Value: A');
  });
});

describe('DatePicker.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-datePickerValue').should('contain', 'Value: 2020-06-25T22:00:00.000Z');
  });
});

describe('SwatchColorPicker.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#fluentInputs-swatchColorPicker').within(() => {
      cy.get('#fluentInputs-swatchColorPicker-orange-0').should('have.attr', 'aria-selected', 'true');
    });
    cy.get('#fluentInputs-swatchColorPickerValue').should('contain', 'Value: orange');
  });
});

describe('Toggle.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('button#fluentInputs-toggle').click();

    cy.get('#fluentInputs-toggleValue').should('contain', 'Value: FALSE');
  });
});

describe('SearchBox.shinyInput()', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    const aText = 'some text';
    cy.get('#fluentInputs-searchBox').type(aText).should('have.value', aText);

    cy.get('#fluentInputs-searchBoxValue').should('contain', `Value: ${aText}`);
  });
});
