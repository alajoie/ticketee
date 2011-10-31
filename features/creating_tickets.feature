Feature: Creating Tickets
In order to create tickets for projects
As a user
I want to be able to select a project and do that

Background:
	Given there is an existing project
	And I am on the homepage
	When I select the existing project
	And I go to the ticket creation page

Scenario: Creating a ticket
	When I create a ticket
	Then I should see a ticket created confirmation message

Scenario: Creating a ticket without valid attributes fails
	When I try to create a ticket without valid attributes
	Then I should see a message informing me the ticket has not been created
	And I should see messages informing me of the invalidly entered attributes

Scenario: Description must be longer than 10 character
	When I try to create a ticket with a too short description
	Then I should see a message informing me the ticket has not been created
	And I should see a message informing me that the Description is too short
