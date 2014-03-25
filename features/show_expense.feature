Feature: Show expenses
  As a visitor to the website
  I want to show the expense items
  so that I can get details of expense items

    Scenario: Viewing expenses
      Given I am logged in
       And Some "expense" items exist
      When I look at the list of "expenses"
      Then I should see "expenses" items

    Scenario: Viewing an expense item
      Given I am logged in
       And Some "expense" items exist
      When I look at the list of "expenses"
       And I click a id-number of "expense"
      Then I should see detail of an expense item
