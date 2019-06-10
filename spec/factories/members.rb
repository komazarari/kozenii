# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :member do
    fullname { "Full Name" }
    nick { "Nick" }
    yomi { "nick" }
    obligation { 1 }
  end
end
