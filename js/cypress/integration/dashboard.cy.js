describe('Dashboard', () => {
  it('Slider', () => {
    cy.visit('#!/Slider');
    const steps = 15;
    const arrows = '{rightarrow}'.repeat(steps);
    cy.get('.ms-Slider-slideBox')
      .focus()
      .type(arrows);
    cy.contains('Value: 15');
  });
  it('Dropdown', () => {
    cy.visit('#!/Dropdown');
    cy.get('.ms-Dropdown-title').click();
    cy.get('.ms-Dropdown-item').contains('Option C').click();
    cy.contains('Value: C');
  });
});
