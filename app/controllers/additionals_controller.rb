class AdditionalsController < ApplicationController
  def create
    @additional = Additional.new(additional_params)
    @daycare = Daycare.find(params[:daycare_id])
    @additional.daycare = @daycare

    @additional.save

    #create new additional to display create additional form so users can add more programs
    @additional = Additional.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @daycare = Daycare.find(params[:daycare_id])
    @additional = Additional.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @additional = Additional.find(params[:id])
    @daycare = Daycare.find(params[:daycare_id])
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
    @daycare = Daycare.find(params[:daycare_id])

    params['additional'].each_with_index do |id, index|
      additional = Additional.find(id)
      additional.update_attribute(:position, index+1) if additional
    end
    render nothing: true
  end

  private
  def additional_params
    params.require(:additional).permit(:title, :content, :image, :id, :position)
  end
end
