Given(/^the following users:$/) do |table|
  # https://github.com/cucumber/cucumber/wiki/Step-Argument-Transforms
  table.hashes.each do |row|
    row.merge!({:password_confirmation => row[:password]})
    u = FactoryGirl.create(:user, row)
  end
end

Given /^a valid user logged in$/ do
  step "the following users:", 
  Cucumber::Ast::Table.parse('''
  | username | email | password|
  | user1 | user1@email.com |12345abcdef|
  ''', nil, nil)

  step "I go to the landing page"
  step "I click on the Login link"
  step "I fill in my login_email with user1@email.com"
  step "I fill in my login_password with 12345abcdef"
  step "I press Sign In"
end

