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
    fill_in 'phone', :with => '123-456-7890'
    fill_in 'email', :with => 'user@email.com'
    click_button 'Add Contact'
    expect(page).to have_content '1234 Address Dr'
  end
end
