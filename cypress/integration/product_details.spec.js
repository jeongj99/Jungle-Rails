describe("Products page", () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("Can navigate to the first product's page", () => {
    cy.get(".products article")
      .first()
      .click();
    
    cy.get(".products-show .product-detail").should("be.visible");
  });

  it("Can navigate to the second product's page", () => {
    cy.get(".products article")
      .last()
      .click();
    
    cy.get(".products-show .product-detail").should("be.visible");
  });
});