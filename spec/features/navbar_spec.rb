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

  it "displays daycare name and edit, and view daycare links if user has daycare" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit root_path
    expect(page).to have_content 'My Daycare'
    expect(page).to have_css "a#menu-view-daycare"
    expect(page).to have_css "a#menu-edit-daycare"
    expect(page).to_not have_content 'Add Daycare'
  end

  it "site name link navigates to home page" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit user_daycare_path(user, daycare)
    click_link 'beebsy'
    expect(page).to have_content('Home')
  end

  it "home link navigates to home page" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit user_daycare_path(user, daycare)
    find('.dropdown').click
    find('#menu-home').click
    expect(page).to have_content('Home')
  end

  it "view daycare link navigates to daycare page" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit user_daycare_path(user, daycare)
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_css("span.name", :text => "My Daycare")
  end

  it "edit daycare link navigates to edit daycare page" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit user_daycare_path(user, daycare)
    find('.dropdown').click
    find('#menu-edit-daycare').click
    expect(page).to have_css("span.daycare-edit-glyph")
  end

  it "sign out link signs user out" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit user_daycare_path(user, daycare)
    expect(page).to have_content('My Daycare')
    find('.dropdown').click
    find('#menu-signout').click
    expect(page).to_not have_content('My Daycare')
  end
end
