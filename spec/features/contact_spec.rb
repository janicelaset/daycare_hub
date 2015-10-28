require 'rails_helper'

describe "the contact crud process" do
  it "allows user to add contact information", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_path(user)
    click_link 'daycare-add-contact'
    fill_in 'Address', :with => '1234 Address Dr'
    fill_in 'City', :with => 'City'
    fill_in 'State', :with => 'OR'
    fill_in 'Zip', :with => '12345'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Phone', :with => '123-456-7890'
    click_button 'Create Contact'
    expect(page).to have_content '1234 Address Dr'
  end

  it "allows users to update contact information" do
    daycare = FactoryGirl.create(:daycare)
    contact = FactoryGirl.create(:contact)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_path(user)
    click_link 'daycare-edit-contact'
    fill_in 'Address', :with => 'New Address Dr'
    click_button 'Update Contact'
    expect(page).to have_content 'New Address Dr'
  end
end
