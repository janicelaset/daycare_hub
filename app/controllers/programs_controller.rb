class ProgramsController < ApplicationController
  before_action :find_daycare
  before_action :find_user, only: [:create, :update]
  before_action :init_state

  def create
    @program = Program.new(program_params)
    @program.daycare = @daycare
    @program.save

    @programs = @daycare.programs.order("position")

    #create new program to display create program form so users can add more programs
    @program = Program.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @program = Program.find(params[:id])
    @program.update(program_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    if @daycare.programs.any?
      @programs = @daycare.programs.order("position")
    else
      @programs = []
    end
  end

  def move
    params['program'].each_with_index do |id, index|
      program = Program.find(id)
      program.update_attribute(:position, index+1) if program
    end

    #re-rendering programs_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    # @programs = @daycare.programs.order("position")

    respond_to do |format|
      format.js
    end
  end

  def wizard
    @wizard = true
    @daycare = Daycare.find_by_url(params[:id])
    @programs = @daycare.programs
    @program = Program.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def program_params
    params.require(:program).permit(:name, :description, :age_from, :age_from_units, :age_to, :age_to_units, :picture, :available, :id, :position)
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
