require 'rails_helper'

describe "The teacher crud process" do
  it "allows the user to add a teacher" do
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
end
