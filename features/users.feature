Feature: Users
	In order to sign up an account
	As a visitor
	
	Scenario: Create a new account
	When I go to the new user page
	Then I see a register button
	And I fill in my  username with William
	And I fill in my email with goodgodwin@hotmail.com
	And I fill in my password with mypasswordtest
	And I fill in my password_confirmation with mypasswordtest
	And I press register
	Then I should see User was successfully created
	