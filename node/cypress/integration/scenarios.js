describe('Raw JS', () => {
  it('runs on the client', () => {
    cy.visit('/');

    const stub = cy.stub();
    cy.on('window:alert', stub);

    cy.get('button[data-content="Tab 2"]').click().then(() => {
      expect(stub.getCall(0)).to.be.calledWith('Pivot tab switched');
    });
  });
});

describe('Shiny input and output inside an initially hidden Pivot tab', () => {
  it('after appearing send updates to and from server', () => {
    cy.visit('/');

    cy.get('button[data-content="Initially hidden components"]').click().then(() => {
      cy.get('#shinyInReact-textInputHidden')
        .type('my text').should('have.value', 'my text');

      cy.get('#shinyInReact-textInputHiddenValue').should('contain', 'Value: my text');
    });
  });
});

describe('Update input values', () => {
  it('can happen on button click', () => {
    cy.visit('/');

    cy.get('button#shinyInReact-updateInputs').click().then(() => {
      cy.get('#shinyInReact-textInputButtonValue').should('contain', 'Value: new text');
    });
  });
});
