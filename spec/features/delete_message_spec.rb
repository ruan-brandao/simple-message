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
end
