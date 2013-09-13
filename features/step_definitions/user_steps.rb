def visitor
  @visitor ||= { username: "Testy McUserton", password: "test", password_confirmation: "test" }
end

def delete_user
  @user ||= User.where(username: visitor[:username]).first
  @user.destroy if @user
end

def create_user
  visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def sign_in
  visit new_user_session_path
  fill_in "user_username", with: @visitor[:username]
  fill_in "user_password", with: @visitor[:password]
  click_button "Sign in"
end


Given(/^I do not exist as a user$/) do
  visitor
  delete_user
end

Given(/^I exist as a user$/) do
  create_user
end

Given(/^I am logged in$/) do
  create_user
  sign_in
end

Given(/^I am not logged in$/) do
  visit destroy_user_session_path
end

When(/^I sign in with valid credentials$/) do
  visitor
  sign_in
end

When(/^I sign out$/) do
  visit destroy_user_session_path
end

When(/^I return to the site$/) do
  visit '/'
end

When(/^I sign in with a wrong username$/) do
  @visitor = @visitor.merge(username: "wrongman")
  sign_in
end

When(/^I sign in with a wrong password$/) do
  @visitor = @visitor.merge(password: "wrongpass")
  sign_in
end

When(/^I edit my account details$/) do
  click_link "Edit Account"
  fill_in "user_username", with: "newname"
  fill_in "user_current_password", with: @visitor[:password]
  click_button "Update"
end

When(/^I look at the list of users$/) do
  visit users_path
end

Then(/^I see an invalid login message$/) do
  page.should have_content "Invalid username or password"
end

Then(/^I should be signed out$/) do
  page.should have_content "Sign in"
  page.should_not have_content "Sign out"
end

Then(/^I should see a sign in page$/) do
  page.should have_content "Sign in"
end

Then(/^I see a successful sign in message$/) do
  page.should have_content "successfully"
end

Then(/^I should be signed in$/) do
  page.should have_content @visitor[:username]
  page.should have_content "Sign Out"
end

Then(/^I should see an account edited message$/) do
  page.should have_content /updated\s*.*\s*successfully/
end

Then(/^I should see my name$/) do
  page.should have_content @visitor[:username]
end
