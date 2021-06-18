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

describe('Dynamic rendering', () => {
  it('Label works', () => {
    cy.get('[data-cy=reactInShiny-label]').contains("I'm a Label with count value = 0");
    cy.get('#reactInShiny-count').clear().type(10);
    cy.get('[data-cy=reactInShiny-label]').contains("I'm a Label with count value = 10");
  });

  it('PrimaryButton works', () => {
    cy.get('[data-cy=reactInShiny-primaryButton]').within(() => {
      cy.get('.ms-Button-label').contains('PrimaryButton');
    });
  });

  it('TeachingBubble works', () => {
    cy.get('[data-cy=reactInShiny-toggle]').click();
    cy.get('.ms-TeachingBubble-body > .ms-TeachingBubble-subText').contains('Very useful!');
    cy.get('[data-cy=reactInShiny-toggle]').click();
  });

  it('Modal works', () => {
    cy.get('[data-cy=reactInShiny-showModal]').click();
    cy.get('[data-cy=reactInShiny-modal-h1]').contains('This is an important message');
    cy.get('[data-cy=reactInShiny-modal-p]').contains('Read this text to learn more');
    cy.get('[data-cy=reactInShiny-hideModal]').click();
  });

  it('Pivot works', () => {
    cy.get('[data-cy=reactInShiny-pivot] > .ms-Pivot > button[name="Tab 2"]').click();
    cy.get('[data-cy=reactInShiny-pivotLabel]').contains('Hello 2');
  });

  it('Leaflet in pivot works', () => {
    cy.get('[data-cy=reactInShiny-pivot] > .ms-Pivot > button[name="Tab 2"]').click();
    cy.get('#reactInShiny-map').should('be.visible');
  });
});
