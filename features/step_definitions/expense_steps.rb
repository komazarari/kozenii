When(/^I click a link to create "(.*?)"$/) do |arg1|
  click_on "new_#{arg1}"
end

Then(/^I should be on the new expense page$/) do
  page.should have_field("expense_spend_for")
  page.should have_field("expense_amount")
  page.should have_field("expense_comment")
end

Given(/^Some "(.*?)" items exist$/) do |arg1|
  5.times { FactoryGirl.create(arg1.to_sym) }
end

When(/^I look at the list of "(.*?)"$/) do |arg1|
  visit root_path
  click_link 'expenses'
end

Then(/^I should see "(.*?)" items$/) do |arg1|
  page.should have_selector 'table tr'
  page.should have_table arg1
  # should have date, such as '2013-4-10', '2013/05/05'
  page.should have_content %r!\d{4}[-/]\d{1,2}[-/]\d{1,2}!
end

When(/^I click a id-number of "(.*?)"$/) do |arg1|
  @item = arg1.capitalize.constantize.last
  click_link @item.id
end

Then(/^I should see detail of an "(.*?)" item$/) do |arg1|
  page.should have_content %r!\d{4}[-/]\d{1,2}[-/]\d{1,2}!
  page.should have_content @item.spend_for
  page.should have_content number_to_currency(@item.amount)
end

Given(/^I am admin user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click a link to edit "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the edit "(.*?)" page$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
