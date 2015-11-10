require 'rails_helper'

describe "The daycare search process" do
  it "displays daycares within range of specified address", js: true do
    address = FactoryGirl.create(:address)
    visit root_path
    fill_in 'search-text-field', :with => '17683 SW Farmington Rd Aloha, OR 97007'
    click_button 'Go!'
    binding.pry
    expect(page).to have_content 'My Daycare'
  end
end
