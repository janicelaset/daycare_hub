class AdditionalsController < ApplicationController
  before_action :find_daycare, except: [:destroy]

  def create
    @additional = Additional.new(additional_params)
    @additional.daycare = @daycare
    @additional.save

    @additionals = @daycare.additionals.order("position")

    if @additional.errors.nil?
      #create new additional to display create additional form so users can add more programs
      @additional = Additional.new
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @additional = Additional.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @additional = Additional.find(params[:id])
    @additionals = @daycare.additionals

    @additional.update(additional_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @additional = Additional.find(params[:id])
    @additional.destroy
  end

  def move
    params['additional'].each_with_index do |id, index|
      additional = Additional.find(id)
      additional.update_attribute(:position, index+1) if additional
    end

    #re-rendering additional_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    @additionals = @daycare.additionals.order("position")

    respond_to do |format|
      format.js
    end
  end

  private
  def additional_params
    params.require(:additional).permit(:title, :content, :image, :id, :position)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end
end
