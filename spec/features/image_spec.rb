require 'rails_helper'
require 'spec_helper'

describe "Image crud process" do
  it "allows user to add image to daycare", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-add-image'
    fill_in 'image-edit-desc', :with => 'Photo Description'
    find("#btn-select-image").trigger('click')
    attach_file('image[picture]', 'spec/images/daycare.jpg')
    sleep(2)
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'Photo Description'
  end

  it "allows user to delete image for daycare", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-add-image'
    fill_in 'image-edit-desc', :with => 'Photo Description'
    attach_file('image[picture]', 'spec/images/daycare.jpg')
    sleep(2) #should add wait_for_ajax method here (this is not a good fix)
    find("#image-delete-#{daycare.images.first.id}").trigger('click')  #icon is on draggable panel header(overlapping elements)
    expect(page).to_not have_content 'daycare.jpg'
  end

  it "allows user to update image for daycare", js: true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-add-image'
    fill_in 'image-edit-desc', :with => 'Photo Description'
    attach_file('image[picture]', 'spec/images/daycare.jpg')
    sleep(2)
    image = daycare.images.first
    find("#image-edit-#{image.id}").trigger('click')  #icon is on draggable panel
    fill_in "image-edit-desc#{image.id}", :with => 'Photo Edit'
    click_button 'Update Image'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'Photo Edit'
  end
end
