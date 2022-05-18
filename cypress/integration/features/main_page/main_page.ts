import { When, Then, Before } from "cypress-cucumber-preprocessor/steps";
import { timeout, baseURL } from "../../../constants";
import { DataTable } from 'cucumber';

beforeEach(() => {
  cy.intercept("GET", "**/api/search/suggest?*").as("suggestSearch");
  cy.intercept("GET", "**/api/search/products?*").as("productSearch");
  cy.intercept("GET", "**/api/banners?*").as("banner");
});

Before({ tags: '@english' }, () => {
  cy.visit(`${baseURL}/en`);
  cy.get('span').contains('Categories', { timeout: timeout.elementTimeout});
});

Before({ tags: '@thai' }, () => {
  cy.visit(`${baseURL}/th`);
  cy.get('span').contains('หมวดหมู่สินค้า', { timeout: timeout.elementTimeout});
});

When(
  "I type {string} at the {string} field",
  (value: string, field: string) => {
    let selector: string;
    selector = `input[data-testid='txt-${field}']`;
    if (value === "") {
      cy.get(selector).clear();
    } else {
      cy.get(selector).clear().type(value);
    }
  }
);

When("I click at {string} button", (text: string) => {
  cy.get("button").contains(text).click();
});

When("I click at {string}", (text: string) => {
  cy.get("span").contains(text).click();
});

When("I click search button", () => {
  cy.get("#btn-searchResultPage").should('be.visible', { timeout: timeout.elementTimeout}).click();
});

When("search result {string} displayed in {string}", (value:string, language: string) => {
  if (language === 'thai') {
    cy.get("div")
    .contains(`ผลการค้นหาสำหรับ "${value}"`)
    .should("be.visible");
  } else {
    cy.get("div")
    .contains(`Search results for "${value}"`)
    .should("be.visible");
  }
  cy.get(`[data-testid="pnl-ListPage"]`).should("be.visible", { timeout: timeout.waitingpageLoad });
});

Then("expect search result location {string} should be {string}", (element:string, result: string) => {
  cy.get(`[data-testid="${element}"]`).should('be.visible').contains(result);
});

Then(
  'Expect displayed the categories should be correctly',
  (data: DataTable) => {
    data.hashes().forEach((elem: any) => {
      cy.contains(elem.categories).should('be.visible').click();
      cy.url().should('eq', `${baseURL}/en/${elem.result}`);
    });
  }
);

Then("expect image file shoule be {string}", (result: string) => {
  cy.get(`img[src="${result}"]`).should('be.visible');
});
