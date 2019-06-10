# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :part do
    name { "MyString" }
    show_order { 1 }
  end
end
