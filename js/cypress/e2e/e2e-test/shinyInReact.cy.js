describe('Hidden in pivot', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('textInput() works, content sent to server and displayed in output', () => {
    cy.get('button[data-content="Initially hidden components"]').click();
    cy.get('#shinyInReact-textInputHidden').type('my text');
    cy.get('#shinyInReact-textInputHidden').should('have.value', 'my text');
    cy.get('#shinyInReact-textInputHiddenValue').should('contain', 'Value: my text');
  });

  it('textAreaInput() works, content sent to server and displayed in output', () => {
    const aText = 'some text';
    cy.get('button[data-content="Initially hidden components"]').click();
    cy.get('#shinyInReact-textAreaInputHidden').type(aText);
    cy.get('#shinyInReact-textAreaInputHidden').should('have.value', aText);
    cy.get('#shinyInReact-textAreaInputHiddenValue').should('contain', aText);
  });

  it('checkboxInput() works, content sent to server and displayed in output', () => {
    cy.get('button[data-content="Initially hidden components"]').click();
    cy.get('#shinyInReact-checkboxInputHidden').check();
    cy.get('#shinyInReact-checkboxInputHidden').should('be.checked');
    cy.get('#shinyInReact-checkboxInputHiddenValue').should('contain', 'TRUE');
  });
});

describe('Dynamic rendering', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('textInput() works, content sent to server and displayed in output', () => {
    cy.get('#shinyInReact-textInputDynamic').type('my text');
    cy.get('#shinyInReact-textInputDynamic').should('have.value', 'my text');
    cy.get('#shinyInReact-textInputDynamicValue').should('contain', 'my text');
  });

  it('textAreaInput() works, content sent to server and displayed in output', () => {
    const aText = 'some text';
    cy.get('#shinyInReact-textAreaInputDynamic').type(aText);
    cy.get('#shinyInReact-textAreaInputDynamic').should('have.value', aText);
    cy.get('#shinyInReact-textAreaInputDynamicValue').should('contain', aText);
  });

  it('checkboxInput() works, content sent to server and displayed in output', () => {
    cy.get('#shinyInReact-checkboxInputDynamic').check();
    cy.get('#shinyInReact-checkboxInputDynamic').should('be.checked');
    cy.get('#shinyInReact-checkboxInputDynamicValue').should('contain', 'TRUE');
  });
});

describe('Static rendering', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('textInput() works, content sent to server and displayed in output', () => {
    cy.get('#shinyInReact-textInputStatic').type('my text');
    cy.get('#shinyInReact-textInputStatic').should('have.value', 'my text');
    cy.get('#shinyInReact-textInputStaticValue').should('contain', 'my text');
  });

  it('textInput() works when updated from server', () => {
    cy.get('button#shinyInReact-updateInputs').click();
    cy.get('#shinyInReact-textInputStatic').should('have.value', 'new text');
  });

  it('textAreaInput() works, content sent to server and displayed in output', () => {
    const aText = 'some text';
    cy.get('#shinyInReact-textAreaInputStatic').type(aText);
    cy.get('#shinyInReact-textAreaInputStatic').should('have.value', aText);
    cy.get('#shinyInReact-textAreaInputStaticValue').should('contain', aText);
  });

  it('checkboxInput() works, content sent to server and displayed in output', () => {
    cy.get('#shinyInReact-checkboxInputStatic').check();
    cy.get('#shinyInReact-checkboxInputStatic').should('be.checked');
    cy.get('#shinyInReact-checkboxInputStaticValue').should('contain', 'TRUE');
  });
});
