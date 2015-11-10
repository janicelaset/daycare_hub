require 'rails_helper'

describe "The teacher crud process" do
  it "allows the user to add a teacher", js:true do
    daycare = FactoryGirl.create(:daycare)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-teacher'
    fill_in 'teacher-edit-name', :with => 'TestTeacher'
    fill_in 'About', :with => 'About'
    click_button 'Create Teacher'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'TestTeacher'
  end

  it "allows the user to edit a teacher", js:true do
    daycare = FactoryGirl.create(:daycare)
    teacher = FactoryGirl.create(:teacher)
    daycare.teachers.push(teacher)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-teacher'
    # click_on "teacher-edit-#{teacher.id}"
    find("#teacher-edit-#{teacher.id}").trigger('click')  #icon is on draggable panel header(overlapping elements)
    fill_in "teacher-edit-name#{teacher.id}", :with => 'EditTeacher'
    click_button 'Update Teacher'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'EditTeacher'
  end
end
