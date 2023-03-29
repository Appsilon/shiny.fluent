describe('ShimmeredDetailsList()', () => {
  before(() => {
    cy.visit('/');
  });

  it('is placed in DOM with appropriate props and dimensions', () => {
    cy.get('#shimmer-shimmeredDetailsListOutput').within(() => {
      cy.get('div[role=grid]')
        .should('have.attr', 'aria-label', 'Content is being fetched')
        .should('have.attr', 'aria-busy', 'true');
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
      cy.get('.ms-List-page')
        .children('.ms-List-cell')
        .eq(0)
        .within(() => {
          cy.get('div[aria-colindex=2]').should('contain', 'Mark');
          cy.get('div[aria-colindex=3]').should('contain', 'Swanson');
        });
      cy.get('.ms-List-page')
        .children('.ms-List-cell')
        .eq(1)
        .within(() => {
          cy.get('div[aria-colindex=2]').should('contain', 'Josh');
          cy.get('div[aria-colindex=3]').should('contain', 'Johnson');
        });
    });
  });
});
