require 'rails_helper'

describe "The program crud process" do
  it "allows the user to add a program", js:true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-program'
    fill_in 'program-edit-name', :with => 'TestProgram'
    fill_in 'Description', :with => 'Description'
    click_button 'Create Program'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'TestProgram'
  end
end
