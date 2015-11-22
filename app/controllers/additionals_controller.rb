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

  def destroy
    @additional = Additional.find(params[:id])
    @additional.destroy
  end

  private
  def additional_params
    params.require(:additional).permit(:title, :content, :image, :id, :position)
  end
end
