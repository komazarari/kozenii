# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :comment do
    body { "MyText" }
    expense_id { 1 }
  end
end
