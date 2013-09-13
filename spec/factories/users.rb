# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username 'Test User'
    password 'changeme'
    password_confirmation 'changeme'
  end
end
