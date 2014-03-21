Then(/^I should be on the new expense page$/) do
  page.should have_field("expense_spend_for")
  page.should have_field("expense_amount")
  page.should have_field("expense_comment")
end

Then(/^I should see detail of an expense item$/) do |arg1|
  page.should have_content %r!\d{4}[-/]\d{1,2}[-/]\d{1,2}!
  page.should have_content @item.spend_for
  page.should have_content number_to_currency(@item.amount)
end

When(/^I create a new expense$/) do
  visit new_expense_path
  fill_in 'expense_amount', with: "3210"
  fill_in 'expense_spend_for', with: "for my new bag"
  click_button I18n.t(:submit, default: "Submit")
end

Then(/^the expense should be in the expenses page$/) do
  visit expenses_path
  page.should have_content "for my new bag"
end
