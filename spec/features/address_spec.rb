require 'rails_helper'

describe "the address crud process" do
  it "allows user to add address information", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-address'
    fill_in 'Street', :with => '1234 Address Dr'
    fill_in 'City', :with => 'City'
    fill_in 'State', :with => 'OR'
    fill_in 'Zip', :with => '12345'
    click_button 'Create Address'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content '1234 Address Dr'
  end

  it "allows users to update address information", js:true do
    address = FactoryGirl.create(:address)
    daycare = address.daycare
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-address'
    fill_in 'Street', :with => 'New Address Dr'
    click_button 'Update Address'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'New Address Dr'
  end
end
