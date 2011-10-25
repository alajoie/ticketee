Feature: Editing Projects
  In order to update project information
  As a user
  I want to be able to do that through an interface

  Scenario: Updating a project
    Given there is an existing project
    And I am on that project's page
    When I go to the project's edit page
    And I update the project information
    Then I should get an update verification message
    And I should be on the updated project's page

