Feature: Signing in
	In order to use the site
	As a user
	I want to be able to sign in

	Scenario: Signing in via confirmation
		Given a registered user
		And the registered user opens the confirmation email
		And they click the first link in the email
		Then a the account confirmation message should be shown
		And the registered user should be signed in
