Feature: Editing tickets
	In order to alter ticket information
	As a user
	I want a form to edit the tickets

Background:
	Given an existing project with a ticket
	Given I am on the homepage
	When I go to the ticket page
	When I go to the ticket's edit page

	Scenario: Updating Ticket
		When I update the ticket's title
		Then I should receive a confirmation of the ticket update
		And I should see the new title within a second level header
		But I should not see the old title

	Scenario: Updating Ticket with invalid information
		When I update the ticket's title with invlaid data
		Then I should see a notification that the ticket has not been updated
