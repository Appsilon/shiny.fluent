describe('Hidden in pivot', () => {
  it('textInput() works, content sent to server and displayed in output', () => {
    cy.visit('/');

    cy.get('button[data-content="Initially hidden components"]').click().then(() => {
      cy.get('#shinyInReact-textInputHidden').type('my text').should('have.value', 'my text');

      cy.get('#shinyInReact-textInputHiddenValue').should('contain', 'Value: my text');
    });
  });

  it('textAreaInput() works, content sent to server and displayed in output', () => {
    const aText = 'some text';
    cy.visit('/');

    cy.get('button[data-content="Initially hidden components"]').click().then(() => {
      cy.get('#shinyInReact-textAreaInputHidden').type(aText).should('have.value', aText);

      cy.get('#shinyInReact-textAreaInputHiddenValue').should('contain', aText);
    });
  });

  it('checkboxInput() works, content sent to server and displayed in output', () => {
    cy.visit('/');

    cy.get('button[data-content="Initially hidden components"]').click().then(() => {
      cy.get('#shinyInReact-checkboxInputHidden').check().should('be.checked');

      cy.get('#shinyInReact-checkboxInputHiddenValue').should('contain', 'TRUE');
    });
  });
});

describe('Dynamic rendering', () => {
  it('textInput() works, content sent to server and displayed in output', () => {
    cy.visit('/');

    cy.get('#shinyInReact-textInputDynamic').type('my text').should('have.value', 'my text');

    cy.get('#shinyInReact-textInputDynamicValue').should('contain', 'my text');
  });

  it('textAreaInput() works, content sent to server and displayed in output', () => {
    const aText = 'some text';
    cy.visit('/');

    cy.get('#shinyInReact-textAreaInputDynamic').type(aText).should('have.value', aText);

    cy.get('#shinyInReact-textAreaInputDynamicValue').should('contain', aText);
  });

  it('checkboxInput() works, content sent to server and displayed in output', () => {
    cy.visit('/');

    cy.get('#shinyInReact-checkboxInputDynamic').check().should('be.checked');

    cy.get('#shinyInReact-checkboxInputDynamicValue').should('contain', 'TRUE');
  });
});

describe('Static rendering', () => {
  it('textInput() works, content sent to server and displayed in output', () => {
    cy.visit('/');

    cy.get('#shinyInReact-textInputStatic').type('my text').should('have.value', 'my text');

    cy.get('#shinyInReact-textInputStaticValue').should('contain', 'my text');
  });

  it('textInput() works when updated from server', () => {
    cy.visit('/');

    cy.get('button#shinyInReact-updateInputs').click().then(() => {
      cy.get('#shinyInReact-textInputStatic').should('have.value', 'new text');
    });
  });

  it('textAreaInput() works, content sent to server and displayed in output', () => {
    const aText = 'some text';
    cy.visit('/');

    cy.get('#shinyInReact-textAreaInputStatic').type(aText).should('have.value', aText);

    cy.get('#shinyInReact-textAreaInputStaticValue').should('contain', aText);
  });

  it('checkboxInput() works, content sent to server and displayed in output', () => {
    cy.visit('/');

    cy.get('#shinyInReact-checkboxInputStatic').check().should('be.checked');

    cy.get('#shinyInReact-checkboxInputStaticValue').should('contain', 'TRUE');
  });
});
