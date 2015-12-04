require 'rails_helper'

describe "the sign in process" do
  it "signs up user with user name" do
    visit new_user_registration_path
    fill_in 'User name', :with => 'user'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'user'
  end

  it "signs in user with user name" do
    user = FactoryGirl.create(:user)
    visit user_session_path
    fill_in 'user_login', :with => 'testuser'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'testuser'
  end

  it "returns error if user signs up with a user name of existing email" do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path
    fill_in 'User name', :with => 'email@email.com'
    fill_in 'Email', :with => 'testuser@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'User name is invalid'
  end

  it "directs users with no daycare to new daycare page on sign in" do
    user = FactoryGirl.create(:user)
    visit user_session_path
    fill_in 'user_login', :with => 'testuser'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Add Daycare'
  end

  it "directs users with daycare to profile page on sign in" do
    daycare = FactoryGirl.create(:daycare)
    visit user_session_path
    fill_in 'user_login', :with => 'testuser'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'My Daycare'
  end
end
