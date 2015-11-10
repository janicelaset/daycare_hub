class TeachersController < ApplicationController

  def create
    @teacher = Teacher.new(teacher_params)
    @daycare = Daycare.find(params[:daycare_id])
    @teacher.daycare = @daycare

    if @teacher.save
      @teacher = Teacher.new
      respond_to do |format|
        format.html
        format.js
      end
      # redirect_to edit_user_daycare_path(current_user, @daycare)
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

    if @teacher.update(teacher_params)
      # respond_to do |format|
      #   format.html
      #   format.js
      # end
      redirect_to edit_user_daycare_path(current_user, @daycare)

    else
      flash[:notice] = "Teacher information not updated"
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