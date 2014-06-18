# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_menu do
    viewtext "MyString"
    url "MyText"
    enabled true
  end
end
