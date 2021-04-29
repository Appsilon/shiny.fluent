describe('Text field', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#shinyInReact-textInput')
      .type('my text').should('have.value', 'my text');

    cy.get('#shinyInReact-textInputValue').should('contain', 'my text');
  });
});

describe('textAreaInput()', () => {
  it('works when rendered by React', () => {
    const aText = 'some text';
    cy.visit('/');

    cy.get('#shinyInReact-textAreaInput').type(aText).should('have.value', aText);

    cy.get('#shinyInReact-textAreaInputValue').should('contain', aText);
  });
});

describe('checkboxInput()', () => {
  it('works when rendered by React', () => {
    cy.visit('/');

    cy.get('#shinyInReact-checkboxInput').check().should('be.checked');

    cy.get('#shinyInReact-checkboxInputValue').should('contain', 'TRUE');
  });
});
