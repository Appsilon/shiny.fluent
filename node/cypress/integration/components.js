describe('Text field', () => {
  it('contents gets sent to server and displayed in an output', () => {
    cy.visit('/');

    cy.get('#input1')
      .type('my text').should('have.value', 'my text');

    cy.get('#textOutput1').should('contain', 'my text');
  });
});

describe('textAreaInput()', () => {
  it('works when rendered by React', () => {
    const aText = 'some text';
    cy.visit('/');

    cy.get('#input2').type(aText).should('have.value', aText);

    cy.get('#textOutput2').should('contain', aText);
  });
});

describe('checkboxInput()', () => {
  it('works when rendered by React', () => {
    cy.visit('/');

    cy.get('#input3').check().should('be.checked');

    cy.get('#textOutput3').should('contain', 'TRUE');
  });
});
