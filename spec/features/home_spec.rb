require 'rails_helper'

describe "the home page" do
  it "shows the homepage" do
    visit home_path
    expect(page).to have_content 'Welcome to Leave Me a Message!'
    expect(page).to have_content 'Log In'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Sign up'
  end

  it "allows logged in users the ability to check messages" do
    user = FactoryGirl.create(:user)
    visit home_path
    click_on 'Sign in'
    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'You currently have 0 messages, Kinsey'
  end
end
