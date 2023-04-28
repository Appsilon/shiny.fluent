describe('Fluent components inside Shiny tabset', () => {
  before(() => {
    cy.visit('/');
    cy.get('#deepMixing-tabs1').within(() => {
      cy.get('a[data-value=JSX]').click();
    });
  });

  it('Label is visible', () => {
    cy.get('[data-cy=deepMixing-label').should('be.visible');
  });

  it('PrimaryButton is visible', () => {
    cy.get('[data-cy=deepMixing-primaryButton').should('be.visible');
  });
});

describe('JSX inside uiOutput inside JSX', () => {
  before(() => {
    cy.get('[data-cy=deepMixing-pivot] > .ms-Pivot > button[name="Leaflet inside a Pivot"]').click();
  });

  it('Leaflet inside Pivot is visible', () => {
    cy.get('[data-cy=deepMixing-pivot] > div[role=tabpanel]').within(() => {
      cy.get('#deepMixing-map').should('be.visible');
    });
  });
});

describe('Leaflet in Pivot in uiOutput in Pivot in uiOutput in JSX', () => {
  before(() => {
    cy.get('[data-cy=deepMixing-pivot] > .ms-Pivot > button[name="Another level of nesting"]').click();
    cy.get('[data-cy=deepMixing-nestedPivot] > .ms-Pivot > button[name="Leaflet inside a Pivot"]').click();
  });

  it('Leaflet inside nested Pivot is visible', () => {
    cy.get('[data-cy=deepMixing-nestedPivot] > div[role=tabpanel]').within(() => {
      cy.get('#deepMixing-map').should('be.visible');
    });
  });
});
