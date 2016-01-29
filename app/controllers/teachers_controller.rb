class TeachersController < ApplicationController

  def create
    @teacher = Teacher.new(teacher_params)
    @daycare = Daycare.find(params[:daycare_id])
    @teacher.daycare = @daycare
    @teachers = @daycare.teachers
    @teacher.save

    #create new teacher to display create teacher form so users can add more teachers
    @teacher = Teacher.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @daycare = Daycare.find(params[:daycare_id])
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @teacher = Teacher.find(params[:id])
    @daycare = Daycare.find(params[:daycare_id])
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
    @daycare = Daycare.find(params[:daycare_id])

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
end
