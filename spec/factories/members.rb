# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    fullname "MyString"
    nick "MyString"
    yomi "MyString"
    obligation 1
  end
end
