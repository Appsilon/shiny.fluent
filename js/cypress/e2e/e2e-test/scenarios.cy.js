describe('Raw JS', () => {
  it('runs on the client', () => {
    cy.visit('/');
    cy.window().then((win) => {
      cy.stub(win, 'alert').as('alert');
    });
    cy.get('button[data-content="Tab 2"]').click();
    cy.get('@alert').should('have.been.calledOnce');
    cy.get('@alert').should('have.been.calledWith', 'Pivot tab switched');
  });
});
