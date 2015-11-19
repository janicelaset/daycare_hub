require 'rails_helper'

describe "the summary crud process" do
  it "allows user to add summary to daycare", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-summary'
    fill_in 'summary_content', :with => 'Daycare summary'
    click_button 'Create Summary'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'Daycare summary'
  end

  it "allows user to update summary on daycare", js: true do
    daycare = FactoryGirl.create(:daycare)
    summary = FactoryGirl.create(:summary)
    daycare.summary = summary
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-summary'
    fill_in 'summary_content', :with => 'daycare update'
    click_button 'Update Summary'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'daycare update'
  end

  it "allows user to delete summary on daycare", js: true do
    daycare = FactoryGirl.create(:daycare)
    summary = FactoryGirl.create(:summary)
    daycare.summary = summary
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-summary'
    click_link 'Delete Summary'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to_not have_content 'daycare summary'
  end
end
