# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:used_date) { |n| Date.new(2013, 4, 1) + n*3 }
  sequence(:amount) { |n| n*1024 }
  sequence(:description) { |n| "buy #{n} note(s)" }
  sequence(:comment) { |n| "My note No.#{n}" }

  factory :expense do
    used_date
    amount
    description
    comment
    status    "open"
    valid_req   true
  end
end
