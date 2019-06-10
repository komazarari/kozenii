# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  sequence(:used_date) { |n| Date.new(2013, 4, 1) + n*3 }
  sequence(:amount) { |n| n*1024 }
  sequence(:description) { |n| "buy #{n} note(s)" }
  sequence(:user_note) { |n| "My note No.#{n}" }

  factory :expense do
    used_date
    amount
    description
    user_note
    member
    status    { "open" }
    valid_req   { true }
  end
end
