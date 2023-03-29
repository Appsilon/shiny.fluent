describe('Dashboard', () => {
  it('Slider', () => {
    cy.visit('http://localhost:8889/#!/Slider');
    const steps = 15;
    const arrows = '{rightarrow}'.repeat(steps);
    cy.get('.ms-Slider-slideBox')
      .focus()
      .type(arrows);
    cy.contains('Value: 15');
  });
  it('Dropdown', () => {
    cy.visit('http://localhost:8889/#!/Dropdown');
    cy.get('.ms-Dropdown-title').click();
    cy.get('.ms-Dropdown-item').contains('Option C').click();
    cy.contains('Value: C');
  });
});
