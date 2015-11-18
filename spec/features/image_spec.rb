require 'rails_helper'

describe "Image crud process" do
  it "allows user to add image to daycare" do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-add-image'
    fill_in 'image-edit-desc', :with => 'Photo Description'
    attach_file('image_picture', 'spec/images/daycare.jpg')
    # click_button 'Select Image'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'Photo Description'
  end
end
