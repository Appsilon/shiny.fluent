describe('Label()', () => {
  it('exists in DOM', () => {
    cy.visit('/');
    cy.get('#reactInShiny-label')
      .should('have.attr', 'class')
      .and('contain', 'ms-Label');
    cy.get('#reactInShiny-label').should('contain', "I'm a Label");
  });
});

describe('Icon()', () => {
  it('exists in DOM', () => {
    cy.visit('/');
    cy.get('#reactInShiny-compass').should('have.attr', 'class').and('contain', 'ms-Icon');
  });

  it('setting style attribute works', () => {
    cy.visit('/');

    cy.get('#reactInShiny-compass').should('have.attr', 'data-icon-name', 'CompassNW');
    cy.get('#reactInShiny-compass').should('have.attr', 'style').and('contain', 'width: 50px;');
    cy.get('#reactInShiny-compass').should('have.attr', 'style').and('contain', 'height: 50px;');
    cy.get('#reactInShiny-compass').should('have.attr', 'style').and('contain', 'font-size: 50px;');
    cy.get('#reactInShiny-compass').should('have.attr', 'style').and('contain', 'margin: 10px;');
    cy.get('#reactInShiny-compass').should('have.attr', 'style').and('contain', 'color: deepskyblue;');
  });
});

describe('Spinner()', () => {
  it('exists in DOM', () => {
    cy.visit('/');
    cy.get('#reactInShiny-spinner').should('have.attr', 'class').and('contain', 'ms-Spinner');
  });

  it('has spinner circle', () => {
    cy.visit('/');
    cy.get('#reactInShiny-spinner').within(() => {
      cy.get('.ms-Spinner-circle').should('exist');
    });
  });

  it('has correct label', () => {
    cy.visit('/');
    cy.get('#reactInShiny-spinner').within(() => {
      cy.get('.ms-Spinner-label').contains('I am definitely loading');
    });
  });
});
