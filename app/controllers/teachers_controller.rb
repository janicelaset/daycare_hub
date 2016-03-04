class TeachersController < ApplicationController
  before_action :find_daycare, except: [:destroy]

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.daycare = @daycare
    @teacher.save
    
    @teachers = @daycare.teachers.order("position")

    #create new teacher to display create teacher form so users can add more teachers
    @teacher = Teacher.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teachers = @daycare.teachers

    @teacher.update(teacher_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
  end

  def move
    #re-rendering teacher_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    @teachers = @daycare.teachers

    params['teacher'].each_with_index do |id, index|
      teacher = Teacher.find(id)
      teacher.update_attribute(:position, index+1) if teacher
    end

    respond_to do |format|
      format.js
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :about, :picture, :id, :position)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end
end
