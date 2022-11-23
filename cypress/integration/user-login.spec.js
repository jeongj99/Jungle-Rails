describe("Sign up and log in", () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("Should be able to register and once registered, it should take them to the home page with the nav bar displaying logout", () => {
    cy.get("[data-test-id=register-link]").click();

    cy.get("#user_first_name").type("Obiwan");

    cy.get("#user_last_name").type("Kenobi");

    cy.get("#user_email").type("abcd@gmail.com");

    cy.get("#user_password").type("password");

    cy.get("#user_password_confirmation").type("password");

    cy.get("form").submit();

    cy.contains("li", "Signed in as Obiwan Kenobi");

    cy.contains("li", "Logout");
  });

  it("Should be able to log in and once logged in, it should take them to the home page with the nav bar displaying logout", () => {
    cy.get("[data-test-id=login-link]").click();

    cy.get("#email").type("alexj@gmail.com");
    
    cy.get("#password").type("password");

    cy.get("form").submit();

    cy.contains("li", "Signed in as Alex Jeong");

    cy.contains("li", "Logout");
  })
});