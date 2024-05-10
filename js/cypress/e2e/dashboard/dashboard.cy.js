describe('Dashboard', () => {
  it('Slider', () => {
    cy.visit('/#!/Slider');
    const steps = 15;
    const arrows = '{rightarrow}'.repeat(steps);

    cy.get('#Slider .ms-Slider-slideBox').type(arrows);
    cy.contains('Value: 15');
  });

  it('Dropdown', () => {
    cy.visit('/#!/Dropdown');
    cy.get('#Dropdown-dropdown-option').click();
    cy.get('#Dropdown-dropdown-list2').click();
    cy.contains('Value: C');
  });
});
