Given(/^I am admin user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I look at the list of "(.*?)"$/) do |arg1|
  visit root_path
  click_link arg1
end
