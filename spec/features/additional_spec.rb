require 'rails_helper'

describe "the additional crud process" do
  it "allows user to add additional information", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-additional'
    fill_in "additional-edit-name", :with => 'New Info'
    fill_in 'Content', :with => 'New Content'
    click_button 'Create Additional'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'New Content'
  end
end
