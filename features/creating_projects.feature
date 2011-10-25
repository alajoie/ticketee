Feature: Creating projects
	In order to have projects to assign tickets to
	As a user
	I want to create them easily

	Background: 
	  Given I am on the homepage
     	  When I navigate to the new project creation page

	Scenario: Creating a project
	  And I create a new project  
	  Then I should be shown the project created verification
          And I should be on the project page for the new project

	Scenario: Creating a project without a name
	  And I try to create a project without a name
	  Then I should be informed that the project has not been created
	  And I should be told that the name is required.

