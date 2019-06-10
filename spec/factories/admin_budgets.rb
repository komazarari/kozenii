# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :budget, :class => 'Budget' do
    title { "MyString" }
    amount { 1 }
    group_id { 1 }
  end
end
