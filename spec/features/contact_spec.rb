require 'rails_helper'

describe "the contact crud process" do
  it "allows user to add contact information", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-contact'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Phone', :with => '123-456-7890'
    click_button 'Create Contact'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'user@email.com'
  end

  it "allows users to update contact information", js:true do
    daycare = FactoryGirl.create(:daycare)
    contact = FactoryGirl.create(:contact)
    user = daycare.user
    daycare.contact = contact
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-contact'
    fill_in 'Email', :with => 'newemail@email.com'
    click_button 'Update Contact'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'newemail@email.com'
  end
end
