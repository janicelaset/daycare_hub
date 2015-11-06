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
    else
      # process error
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
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:notice] = "Teacher information not updated"
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :about, :picture)
  end
end
