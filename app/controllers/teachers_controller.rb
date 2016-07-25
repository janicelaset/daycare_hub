class TeachersController < ApplicationController
  before_action :find_daycare
  before_action :find_user, only: [:create, :update]
  before_action :init_state

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

    if @daycare.teachers.any?
      @teachers = @daycare.programs.order("position")
    else
      @teachers = []
    end
  end

  def move
    params['teacher'].each_with_index do |id, index|
      teacher = Teacher.find(id)
      teacher.update_attribute(:position, index+1) if teacher
    end

    #re-rendering teacher_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    @teachers = @daycare.teachers.order("position")

    respond_to do |format|
      format.js
    end
  end

  def wizard
    @wizard = true
    @daycare = Daycare.find_by_url(params[:id])
    @teachers = @daycare.teachers
    @teacher = Teacher.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :title, :about, :picture, :id, :position)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end

  def find_user
    @user = @daycare.user
  end

  def init_state
    @wizard = false
  end
end
