Feature: Viewing tickets
	In order to view the tickets for a project
	As a user
	I want to see them on that project's page

Background:
	Given there are a couple existing projects
	And each project has some tickets

	Scenario: Viewing tickets for a given project
		When I go to the page of an existing project
		Then I should see the tickets for that project
		And I should not see tickets for other existing projects

	Scenario: Viewing a specific ticket for a given project
		When I go to the page of an existing project
		And I select a ticket
		Then I should be on the ticket's page
		And the ticket title should be in a second level header font
		And I should see the ticket description

	Scenario: Returning to homepage from a ticket
		Given I am on the page of an existing ticket
		And I select the link to the homepage
		Then I should be returned to the homepage
		
		
