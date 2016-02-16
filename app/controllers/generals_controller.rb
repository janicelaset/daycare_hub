class GeneralsController < ApplicationController
  before_action :find_daycare

  def create
    @general = General.new(general_params)
    @general.daycare = @daycare
binding.pry
    @general.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @general = General.find(params[:id])
binding.pry
    @general.update(general_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

private
  def general_params
    params.require(:general).permit(:licensed, :type_of_daycare, :year_opened)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end
end
