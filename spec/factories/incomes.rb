# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :income do
    obtained_date "2014-03-21"
    amount 1
    description "MyText"
    comment "MyText"
    valid_req false
  end
end
