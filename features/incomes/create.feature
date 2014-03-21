Feature: Create incomes
  As a visitor to the website
  I want to create an income item
  so that I can submit my income

  Scenario: Visiting new income page
    Given I am logged in
    When I look at the list of "income"
    And I click a link to create "income"
    Then I should be on the new income page

  Scenario: Creating new income
    Given I am logged in
    When I create a new income
    Then the income should be in the incomes page
