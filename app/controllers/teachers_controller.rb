class TeachersController < ApplicationController

  def create
    @teacher = Teacher.new(teacher_params)
    @daycare = Daycare.find(params[:daycare_id])
    @teacher.daycare = @daycare

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

    @teacher.update(teacher_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def move
    @daycare = Daycare.find(params[:daycare_id])

    params['teacher'].each_with_index do |id, index|
      teacher = Teacher.find(id)
      teacher.update_attribute(:position, index+1) if teacher
    end
    render nothing: true
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :about, :picture, :id, :position)
  end
end
