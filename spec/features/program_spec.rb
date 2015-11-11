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

  it "allows the user to edit a program", js:true do
    daycare = FactoryGirl.create(:daycare)
    program = FactoryGirl.create(:program)
    daycare.programs.push(program)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-program'
    # click_on "program-edit-#{program.id}"
    find("#program-edit-#{program.id}").trigger('click')  #icon is on draggable panel header(overlapping elements)
    fill_in "program-edit-name#{program.id}", :with => 'EditProgram'
    click_button 'Update Program'
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'EditProgram'
  end

  it "allows user to change order of programs listed", js: true do
    daycare = FactoryGirl.create(:daycare)
    program = FactoryGirl.create(:program)
    daycare.programs.push(program)
    program2 = FactoryGirl.create(:program)
    daycare.programs.push(program2)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-program'
    find("#program-edit-#{program.id}").trigger('click')
    fill_in "program-edit-name#{program.id}", :with => 'FirstProgram'
    click_button 'Update Program'
    source = page.find("#panel-name-program-#{program2.id}")
    target = page.find("#panel-name-program-#{program.id}")
    source.drag_to(target)
    find('.dropdown').click
    find('#menu-view-daycare').click
    expect(page).to have_content 'Program Description FirstProgram'
  end

  it "allows the user to delete a program", js:true do
    daycare = FactoryGirl.create(:daycare)
    program = FactoryGirl.create(:program)
    daycare.programs.push(program)
    user = daycare.user
    login_as(user, :scope => :user)
    visit edit_user_daycare_path(user, daycare)
    click_link 'daycare-edit-program'
    find("#program-delete-#{program.id}").trigger('click')
    expect { find("#program-delete-#{program.id}").trigger('click') }.to change(Program, :count).by(-1)
  end
end
