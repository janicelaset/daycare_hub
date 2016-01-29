class ProgramsController < ApplicationController
  def create
    @program = Program.new(program_params)
    @daycare = Daycare.find(params[:daycare_id])
    @program.daycare = @daycare
    @program.save

    @programs = @daycare.programs

    #create new program to display create program form so users can add more programs
    @program = Program.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @daycare = Daycare.find(params[:daycare_id])
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @program = Program.find(params[:id])
    @daycare = Daycare.find(params[:daycare_id])
    @program.update(program_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
  end

  def move
    @daycare = Daycare.find(params[:daycare_id])

    #re-rendering programs_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    @programs = @daycare.programs

    params['program'].each_with_index do |id, index|
      program = Program.find(id)
      program.update_attribute(:position, index+1) if program
    end

    respond_to do |format|
      format.js
    end
  end

  private
  def program_params
    params.require(:program).permit(:name, :description, :age_from, :age_from_units, :age_to, :age_to_units, :picture, :available, :id, :position)
  end
end
