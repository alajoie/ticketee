Feature: Signing up
	In order to be attributed for my work
	As a user
	I want to be able to sign up

	Scenario: Signing up
		Given I am on the homepage
		When I go to the sign up page
		And I complete the sign up form
		Then I should receive a sign up confirmation message

