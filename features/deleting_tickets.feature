Feature: Deleting tickets
	In order to remove tickets
	As a user
	I want to press a button and make them disappear

	Background:
		Given an existing project with a ticket
		When I go to the ticket page

	Scenario: Deleting a Ticket
		When I delete the ticket
		Then I should see a confirmation that the ticket has been deleted
		And I should be on the project's page
		And I should not see the ticket listed
