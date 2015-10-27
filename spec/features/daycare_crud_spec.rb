require 'rails_helper'

describe "the daycare crud process" do
  it "allows user to add daycare", js: true do
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
    visit new_user_path(user)
    fill_in 'Name', :with => ''
    click_button 'Create Daycare'
    expect(page).to have_content 'Please fix these errors'
  end

  it "allows user to update daycare", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_path(user)
    click_link 'daycare-edit-name'
    fill_in 'Name', :with => 'Updated Daycare'
    click_button 'Update Daycare'
    expect(page).to have_content 'Updated Daycare'
  end

  it "displays errors with daycare update method", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_path(user)
    click_link 'daycare-edit-name'
    fill_in 'Name', :with => ''
    click_button 'Update Daycare'
    expect(page).to have_content 'Please fix these errors'
  end

  it "allows user to delete daycare", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit user_path(user)
    find('.dropdown').click
    find('#delete-daycare').click
    expect(page).to have_content 'Add Daycare'
  end
end
