# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :topic do
    title { "MyString" }
    body { "MyText" }
    enabled { false }
  end
end
