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

  it "allows the user to edit additional info", js:true do
    daycare = FactoryGirl.create(:daycare)
    additional = FactoryGirl.create(:additional)
    daycare.additionals.push(additional)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-additional'
    # click_on "additional-edit-#{additional.id}"
    find("#additional-edit-#{additional.id}").trigger('click')  #icon is on draggable panel header(overlapping elements)
    fill_in "additional-edit-name#{additional.id}", :with => 'EditAdditional'
    click_button 'Update Additional'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'EditAdditional'
  end

  it "allows the user to delete additional info", js:true do
    daycare = FactoryGirl.create(:daycare)
    additional = FactoryGirl.create(:additional)
    daycare.additionals.push(additional)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-additional'
    find("#additional-delete-#{additional.id}").trigger('click')
    expect { find("#additional-delete-#{additional.id}").trigger('click') }.to change(Additional, :count).by(-1)
  end
end
