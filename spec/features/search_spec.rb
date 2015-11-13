require 'rails_helper'

describe "The daycare search process" do
  it "displays daycares within range of specified address", js: true do
    address = FactoryGirl.create(:address)
    daycare = address.daycare
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-add-image'
    attach_file('image_picture', 'spec/images/daycare.jpg')
    fill_in 'image-edit-desc', :with => 'Photo Description'
    click_button 'Add Image'
    visit root_path
    fill_in 'search-text-field', :with => '17683 SW Farmington Rd Aloha, OR 97007'
    click_button 'Go!'
    expect(page).to have_content 'My Daycare'
  end

  it "displays daycare search results with default image", js: true do
    address = FactoryGirl.create(:address)
    visit root_path
    fill_in 'search-text-field', :with => '17683 SW Farmington Rd Aloha, OR 97007'
    click_button 'Go!'
    expect(page).to have_content 'My Daycare'
  end

  it "navigate to selected daycare", js: true do
    address = FactoryGirl.create(:address)
    visit root_path
    fill_in 'search-text-field', :with => '17683 SW Farmington Rd Aloha, OR 97007'
    click_button 'Go!'
    click_link 'My Daycare'
    expect(page).to have_content 'My Daycare'
  end
end
