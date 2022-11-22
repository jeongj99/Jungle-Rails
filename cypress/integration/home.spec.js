describe("visit home page of our Jungle App", () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
})