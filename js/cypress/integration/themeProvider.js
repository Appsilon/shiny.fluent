describe('ShimmeredDetailsList()', () => {
  const backgroundColor = 'rgb(50, 49, 48)';
  const primaryColor = 'rgb(141, 212, 0)';

  before(() => {
    cy.visit('/');
  });

  it('should set background color', () => {
    cy.get('[data-cy="themeProvider-themeProviderContent"]').within(() => {
      cy.get('div[class^="body-"]')
        .should('have.css', 'background-color', backgroundColor);
    });
  });

  it('should set style of an ActionButton', () => {
    cy.get('[data-cy="themeProvider-themeProviderContent"]').within(() => {
      cy.get('button[data-cy="themeProvider-button"]')
        .should('have.css', 'background-color', primaryColor)
        .and('have.css', 'color', backgroundColor);
    });
  });
});
