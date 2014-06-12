# -*- coding: utf-8 -*-

Then(/^I should be on the new member page$/) do
  page.should have_field("member_fullname")
  page.should have_field("member_nick")
  page.should have_field("member_yomi")
end

When(/^I create a new member$/) do
  visit new_member_path
  fill_in 'member_fullname', with: "Taro Tanaka"
  fill_in 'member_yomi', with: "タナカタロウ"
  fill_in 'member_nick', with: "taro"
  click_button I18n.t(:submit, default: "Submit")
end

Then(/^the member should be in the members page$/) do
  visit members_path
  page.should have_content "Taro Tanaka"
  page.should have_content "タナカタロウ"
end
