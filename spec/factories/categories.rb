# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :category do
    name { "MyString" }
    basic_due { 20000 }
    ext_due { 12000 }
  end
end
