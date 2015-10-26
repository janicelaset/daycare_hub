require 'rails_helper'

describe "the daycare crud process" do
  it "allows user to add daycare" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    daycare = Daycare.new
    visit new_user_path(user)
    fill_in 'Name', :with => 'My Daycare'
    click_button 'Create Daycare'
    expect(page).to have_content 'My Daycare'
  end

  it "displays errors with daycare save method" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    daycare = Daycare.new
    visit new_user_daycare_path(user, daycare)
    fill_in 'Name', :with => ''
    fill_in 'daycare_structure', :with => 'home'
    click_button 'Create Daycare'
    expect(page).to have_content 'Please fix these errors'
  end

  it "allows user to update daycare" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    fill_in 'Name', :with => 'Daycare'
    fill_in 'daycare_structure', :with => 'home'
    click_button 'Update Daycare'
    expect(page).to have_content 'Daycare'
  end

  it "displays errors with daycare update method" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    fill_in 'Name', :with => ''
    fill_in 'daycare_structure', :with => 'home'
    click_button 'Update Daycare'
    expect(page).to have_content 'Please fix these errors'
  end
end
