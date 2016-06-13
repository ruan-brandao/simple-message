require 'rails_helper'

feature "Create message" do
  scenario "creates a new message" do
    user = FactoryGirl.create(:user)
    message_text = "Test message with awesome text"

    sign_in(user)
    visit new_message_path
    fill_in "message_text", with: message_text
    click_button "Create Message"
    visit messages_path

    expect(page).to have_content(message_text)
  end

  scenario "does not create a message without a text" do
    user = FactoryGirl.create(:user)

    sign_in(user)
    visit new_message_path
    click_button "Create Message"

    expect(page).to have_content("The message could not be created")
  end
end
