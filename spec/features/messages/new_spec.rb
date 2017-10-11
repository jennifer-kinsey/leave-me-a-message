require 'rails_helper'

describe "the adding a message process" do

  it "allows a visitor the ability to add a message for a user" do
    user = FactoryGirl.create(:user)
    visit "/#{user.username}"
    fill_in 'message_body', with: "Yo! Whazzzzup!"
    click_button 'Submit'
    expect(page).to have_content 'Message successfully added'
  end

  it "prevents blank messages" do
    user = FactoryGirl.create(:user)
    visit "/#{user.username}"
    fill_in 'message_body', with: ''
    click_button 'Submit'
    expect(page).to have_content 'error'
  end
end
