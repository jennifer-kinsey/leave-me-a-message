require 'rails_helper'

describe "the favoriting/unfavoriting a message process" do

  it "allows a user the ability to mark a message as favorite" do
    user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message)
    visit user_session_path
    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit messages_path
    save_and_open_page
    click_on 'fave-1'
    click_on 'Favorites'
    expect(page).to have_content message.body
  end

  # it "allows the user the ability to remove a favorite" do
  #   user = FactoryGirl.create(:user)
  #   visit "/#{user.username}"
  #   fill_in 'message_body', with: ''
  #   click_button 'Submit'
  #   expect(page).to have_content 'error'
  # end
end
