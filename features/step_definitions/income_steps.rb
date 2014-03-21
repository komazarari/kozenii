Then(/^I should be on the new income page$/) do
  page.should have_field("income_obtained_by")
  page.should have_field("income_amount")
  page.should have_field("income_comment")
end

When(/^I create a new income$/) do
  visit new_income_path
  fill_in 'income_amount', with: "23000"
  fill_in 'income_obtained_by', with: "Ticket sales"
  click_button I18n.t(:submit, default: "Submit")
end

Then(/^the income should be in the incomes page$/) do
  visit incomes_path
  page.should have_content "23000"
end
