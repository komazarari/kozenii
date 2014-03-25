Feature: Update incomes
  As a admin of the website
  I want to update an income item
  so that I can adjust an account

  Scenario: Editing an income item
    Given I am logged in
    And I am admin user
    And Some "income" items exist
    When I click a link to edit "income"
    Then I should be on the edit "income" page
