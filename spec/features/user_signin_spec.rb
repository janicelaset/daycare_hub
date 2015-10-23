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

  it "signs in with user name" do
    user = FactoryGirl.create(:user)
    visit user_session_path
    fill_in 'Login', :with => 'testuser'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it "return error if user signs up with a user name of existing email" do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path
    fill_in 'User name', :with => 'email@email.com'
    fill_in 'Email', :with => 'testuser@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'User name is invalid'
  end

end
