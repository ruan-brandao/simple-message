require 'rails_helper'

feature "Delete message" do
  scenario "with success", js: true do
    user = FactoryGirl.create(:user)
    first_message = FactoryGirl.create(:message, text: "message 1", user: user)
    second_message = FactoryGirl.create(:message, text: "message 2", user: user)

    sign_in user
    visit messages_path
    within "#message-#{first_message.id}" do
      click_link "Delete Message"
      page.driver.browser.switch_to.alert.accept
    end

    expect(page).not_to have_content(first_message.text)
    expect(page).to have_content(second_message.text)
  end

  scenario "fails when trying to delete another user's message", js: true do
    message_creator = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message, text: "I belong to my creator.")

    sign_in other_user
    visit messages_path
    within "#message-#{message.id}" do
      click_link "Delete Message"
      page.driver.browser.switch_to.alert.accept
    end

    expect(page).to have_content(message.text)
    expect(page).to have_content("Permission Denied")
  end
end
