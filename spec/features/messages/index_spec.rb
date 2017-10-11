require 'rails_helper'

describe "the home page" do

  it "shows all the messages for the user" do
    user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message)
    visit user_session_path
    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit messages_path
    expect(page).to have_content 'hey, bud!'
    expect(user.messages.length).to equal 1
  end
end
