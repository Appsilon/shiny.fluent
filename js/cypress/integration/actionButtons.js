describe('DefaultButton.shinyInput()', () => {
  it('click works', () => {
    cy.visit('/');

    cy.get('button#actionButtons-defaultButton').click().then(() => {
      cy.get('#actionButtons-clicks').should('contain', 'Number of clicks: 1');
    });
  });
});

describe('PrimaryButton.shinyInput()', () => {
  it('click works', () => {
    cy.visit('/');

    cy.get('button#actionButtons-primaryButton').click().then(() => {
      cy.get('#actionButtons-clicks').should('contain', 'Number of clicks: 1');
    });
  });
});

describe('CompoundButton.shinyInput()', () => {
  it('click works', () => {
    cy.visit('/');

    cy.get('button#actionButtons-compoundButton').click().then(() => {
      cy.get('#actionButtons-clicks').should('contain', 'Number of clicks: 1');
    });
  });
});

describe('ActionButton.shinyInput()', () => {
  it('click works', () => {
    cy.visit('/');

    cy.get('button#actionButtons-actionButton').click().then(() => {
      cy.get('#actionButtons-clicks').should('contain', 'Number of clicks: 1');
    });
  });
});

describe('Updating buttons', () => {
  before(() => {
    cy.visit('/');
    cy.get('#actionButtons-update').click();
  });

  it('DefaultButton.shinyInput() works', () => {
    cy.get('#actionButtons-defaultButton').within(() => {
      cy.get('.ms-Button-label').should('contain', 'Default Button Updated');
    });
  });

  it('PrimaryButton.shinyInput() works', () => {
    cy.get('#actionButtons-primaryButton').within(() => {
      cy.get('.ms-Button-label').should('contain', 'Primary Button Updated');
    });
  });

  it('CompoundButton.shinyInput() works', () => {
    cy.get('#actionButtons-compoundButton').within(() => {
      cy.get('.ms-Button-label').should('contain', 'Compound Button Updated');
      cy.get('.ms-Button-description').should('contain', 'Compound Button additional text updated');
    });
  });

  it('ActionButton.shinyInput() works', () => {
    cy.get('#actionButtons-actionButton').within(() => {
      cy.get('.ms-Button-label').should('contain', 'Action Button Disabled');
      cy.get('.ms-Icon').should('have.attr', 'data-icon-name', 'Download');
    });
    cy.get('#actionButtons-actionButton').should('have.attr', 'aria-disabled', 'true');
  });
});
