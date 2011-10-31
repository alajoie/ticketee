Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Background:
    Given there is an existing project 

  Scenario: Listing existing projects
    When I am on the homepage
    Then I should see the existing project listed

  Scenario: Going to a project's page from the list
    And I am on the homepage
    When I select the existing project
    Then I should go to the existing project's page
