require 'rails_helper'

describe "the favoriting/unfavoriting a message process" do

  it "allows a user the ability to mark a message as favorite and remove favorite status" do
    user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message)
    visit user_session_path
    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit messages_path
    click_on 'make-fave-1'
    expect(message.favorite).to eq false
    click_on 'remove-fave-1'
    expect(message.favorite).to eq false
  end
end
