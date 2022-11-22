describe("Add product to cart", () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("Should be able to add a product to the cart and the cart should increase by one", () => {
    cy.contains(".nav-item", "My Cart (0)").should("be.visible");

    cy.contains(".btn", "Add")
      .click({ force: true });

    cy.contains(".nav-item", "My Cart (1)").should("be.visible");
  });
});