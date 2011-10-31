Feature: Editing Projects
  In order to update project information
  As a user
  I want to be able to do that through an interface

  Background: 
    Given there is an existing project
    And I am on the existing project's page
    When I go to the project's edit page

  Scenario: Updating a project
    And I update the project information
    Then I should get an update verification message
    And I should be on the updated project's page

  Scenario: Updating a project with invalid attributes is bad
    And I update the project with invalid information
    Then I should be told that the project has not been updated
