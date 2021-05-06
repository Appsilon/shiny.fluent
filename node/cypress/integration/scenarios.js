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
