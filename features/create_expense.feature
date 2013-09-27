Feature: Create expenses
  As a visitor to the website
  I want to create an expense item
  so that I can submit my expense

    Scenario: Creating new expense
      Given I am logged in
      When I look at the list of "expense"
       And I click a link to create "expense"
      Then I should be on the new expense page
