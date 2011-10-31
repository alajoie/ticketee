Feature: Deleting projects
  In order to remove needless projects
  As a project manager
  I want to make them disappear

  Background:
    Given there is an existing project
    And I am on the existing project's page

  Scenario: Deleting a project
    When I delete the project
    Then I should see the project deletion message
    And the project should no longer be in the project listing
  
