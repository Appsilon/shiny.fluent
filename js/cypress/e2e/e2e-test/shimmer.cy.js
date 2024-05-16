describe('ShimmeredDetailsList()', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('is placed in DOM with appropriate props and dimensions', () => {
    cy.get('#shimmer-shimmeredDetailsListOutput').within(() => {
      cy.get('.ms-List-page')
        .children()
        .should('have.length', 10);
    });
  });

  it('contains given number of rows', () => {
    cy.get('#shimmer-shimmeredDetailsListOutput').within(() => {
      cy.get('.ms-List-page').children().should('have.length', 10);
    });
  });

  it('enabled shimmer hides data', () => {
    cy.get('#shimmer-shimmeredDetailsListOutput').within(() => {
      cy.get('.ms-List-page')
        .children('.ms-List-cell')
        .children()
        .should('have.class', 'ms-Shimmer-container');
    });
  });

  it('disabled shimmer shows data', () => {
    cy.get('#shimmer-toggle').click();
    cy.get('#shimmer-shimmeredDetailsListOutput').within(() => {
      cy.get('div[role=grid]').should('have.attr', 'aria-busy', 'false');
      cy.get('[data-list-index="0"] [data-automation-key=name]').should('contain', 'Mark');
      cy.get('[data-list-index="0"] [data-automation-key=surname]').should('contain', 'Swanson');
      cy.get('[data-list-index="1"] [data-automation-key=name]').should('contain', 'Josh');
      cy.get('[data-list-index="1"] [data-automation-key=surname]').should('contain', 'Johnson');
    });
  });
});
