require 'rails_helper'

describe "signing in with user name process" do
  it "signs up a user with user name" do
    visit new_user_registration_path
    fill_in 'User name', :with => 'user'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome!'
  end
end
