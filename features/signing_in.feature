Feature: Signing in
	In order to use the site
	As a user
	I want to be able to sign in

	Scenario: Signing in via confirmation
		Given I am a registered, unconfirmed user
		And I open the confirmation email
		And I click the first link in the email
		Then the account confirmation message should be shown
		And I should be signed in

	Scenario: Signing in via form
		Given I am a registered and confirmed user
		And I am on the homepage
		When I go to the sign in page
		And sign in via the form
		Then I should see a sign in success message
		And I should be signed in 
