class DaycaresController < ApplicationController
  def new
    @daycare = Daycare.new
  end

  def show
    @daycare = Daycare.find(params[:id])
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :structure, :summary)
  end
end
