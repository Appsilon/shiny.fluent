
describe('Dashboard', () => {
    it('Slider', () => { 
        cy.visit('#!/Slider');
        const steps = 15
        const arrows = '{rightarrow}'.repeat(steps); 
        
        cy.get('.ms-Slider-slideBox')
        .focus()
        .type(arrows);

        cy.contains('Value: 15');
    });
})