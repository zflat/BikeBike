Feature: Users
	 Sign up, sign in, sign out and edit info
	
	Scenario: Create a new account
	When I go to the new user page
	Then I see a register button
	And I fill in my  username with William
	And I fill in my email with goodgodwin@hotmail.com
	And I fill in my password with mypasswordtest
	And I fill in my password_confirmation with mypasswordtest
	And I press register
	Then I should see User was successfully created

	Scenario: Log in an existing user
	Given the following users:
	 | username | email | password|
	 | user1 | user1@email.com |12345abcdef|
	When I go to the landing page
	And I click on the Login link
	Then I see Sign In
	And I fill in my login_email with user1@email.com
	And I fill in my login_password with 12345abcdef
	And I press Sign In
	Then I should see Logout
	And I should see My Account

	Scenario: Editing my account
	Given a valid user logged in
	When I go to the landing page
	And I click on the My Account link
	And I click on the Edit link
	And I fill in my user_email with new_user_email@email.com
	And I click on the save button
	And I click on the My Account link
	Then I should see new_user_email@email.com
	And I click on the Logout link
	Then I see Login