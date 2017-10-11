require 'rails_helper'

describe "the authorization process" do

  it "blocks user from going to unpermitted page" do
    user = FactoryGirl.create(:user)
    visit "/#{user.username}"
    fill_in 'message_body', with: "Yo! Whazzzzup!"
    click_button 'Submit'
    expect(page).to have_content 'Message successfully added'
  end
end
