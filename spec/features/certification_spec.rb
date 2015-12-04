require 'rails_helper'

describe "the certification crud process" do
  it "allows user to add certification", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-certification'
    fill_in 'certification-edit-name', :with => 'New Cert'
    fill_in 'certification-edit-desc', :with => 'Cert Description'
    click_button 'Create Certification'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'New Cert'
  end

  it "allows the user to delete certification", js:true do
    daycare = FactoryGirl.create(:daycare)
    certification = FactoryGirl.create(:certification)
    daycare.certifications.push(certification)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-certification'
    find("#certification-delete-#{certification.id}").trigger('click')
    expect { find("#certification-delete-#{certification.id}").trigger('click') }.to change(Certification, :count).by(-1)
  end
end
