# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :link_menu do
    viewtext { "MyString" }
    url { "MyText" }
    enabled { true }
  end
end
