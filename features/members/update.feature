Feature: Update members
  As a admin of the website
  I want to update an member item
  so that I can adjust an account

  Scenario: Editing an member item
    Given I am logged in
    And I am admin user
    And Some "member" items exist
    When I click a link to edit "member"
    Then I should be on the edit "member" page
