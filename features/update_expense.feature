Feature: Update expenses
  As a admin of the website
  I want to update an expense item
  so that I can adjust an account

    Scenario: Editing an expense item
      Given I am logged in
       And I am admin user
       And Some "expense" items exist
      When I click a link to edit "expense"
      Then I should be on the edit "expense" page
