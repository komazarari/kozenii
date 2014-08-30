# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:obtained_date) { |n| Date.new(2014, 4, 1) + n*3 }

  factory :income do
    obtained_date
    amount
    description
    comment
    member
    valid_req true
  end
end
