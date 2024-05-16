function testButtonClick(name) {
  cy.get(`#actionButtons-${name}`).click();
  cy.get('#actionButtons-clicks').should('contain', 'Number of clicks: 1');
}

describe('Clicking buttons', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('DefaultButton.shinyInput()', () => {
    testButtonClick('defaultButton');
  });

  it('PrimaryButton.shinyInput()', () => {
    testButtonClick('primaryButton');
  });

  it('CompoundButton.shinyInput()', () => {
    testButtonClick('compoundButton');
  });

  it('ActionButton.shinyInput()', () => {
    testButtonClick('actionButton');
  });

  it('CommandBarButton.shinyInput()', () => {
    testButtonClick('actionButton');
  });

  it('CommandButton.shinyInput()', () => {
    testButtonClick('actionButton');
  });

  it('IconButton.shinyInput()', () => {
    testButtonClick('actionButton');
  });
});

describe('Updating buttons', () => {
  beforeEach(() => {
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

  it('CommandBarButton.shinyInput() works', () => {
    cy.get('#actionButtons-commandBarButton').within(() => {
      cy.get('.ms-Button-label').should('contain', 'Command Bar Button Updated');
    });
  });

  it('CommandButton.shinyInput() works', () => {
    cy.get('#actionButtons-commandButton').within(() => {
      cy.get('.ms-Button-label').should('contain', 'Command Button Updated');
    });
  });

  it('IconButton.shinyInput() works', () => {
    cy.get('#actionButtons-iconButton').within(() => {
      cy.get('.ms-Icon').should('have.attr', 'data-icon-name', 'Download');
    });
  });
});
