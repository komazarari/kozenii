Feature: Create members
  As a visitor to the website
  I want to create an member item
  so that I can submit my member

  Scenario: Visiting new member page
    Given I am logged in
    When I look at the list of "member"
    And I click a link to create "member"
    Then I should be on the new member page

  Scenario: Creating new member
    Given I am logged in
    When I create a new member
    Then the member should be in the members page
