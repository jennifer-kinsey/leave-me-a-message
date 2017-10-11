require 'rails_helper'

describe "the message deletion process" do
  it "allows a user the ability to delete a message" do
    user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message)
    visit user_session_path
    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit messages_path
    expect(page).to have_content(message.body)
    click_on "message_1"
    expect(page).to have_no_content(message.body)
  end
end
