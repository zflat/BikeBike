# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	sequence(:email) { |n| "person-#{n}@example.com" }
	sequence(:username) { |n| "person-#{n}" }

	factory :user, class: User do |u|
		u.username
		u.email
		u.password "secret"
		u.password_confirmation "secret"
	end
end
