require 'rails_helper'

describe "The navbar links" do
  it "displays 'Add Daycare' link and user name if user with no daycare signs in" do
    user = FactoryGirl.create(:user)
    visit user_session_path
    fill_in 'Login', :with => 'testuser'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Add Daycare'
    expect(page).to have_content 'testuser'
  end

  it "displays daycare name and edit, view, and delete daycare links if user has daycare" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit root_path
    expect(page).to have_content 'My Daycare'
    expect(page).to have_css "a#view-profile"
    expect(page).to have_css "a#edit-profile"
    expect(page).to have_css "a#delete-profile"
    expect(page).to_not have_content 'Add Daycare'
  end
end
