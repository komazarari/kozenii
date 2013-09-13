def visitor
  @visitor ||= { username: "Testy McUserton", password: "test", password_confirmation: "test" }
end

Given(/^I do not exist as a user$/) do
  @user ||= User.where(username: visitor[:username]).first
  @user.destroy if @user
end

When(/^I sign in with valid credentials$/) do
  visit '/users/sign_in'
  fill_in "user_username", with: visitor[:username]
  fill_in "user_password", with: visitor[:password]
  click_button "Sign in"
end

Then(/^I see an invalid login message$/) do
  page.should have_content "Invalid username or password"
end

Then(/^I should be signed out$/) do
  page.should have_content "Sign in"
  page.should_not have_content "Sign out"
end
