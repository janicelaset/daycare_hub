class DaycaresController < ApplicationController
  def index
    @daycares = Daycare.all
  end

  def new
    @daycare = Daycare.new
  end

  def create
    @daycare = Daycare.new(daycare_params)
    if @daycare.save
      redirect_to daycares_path
    else
      render :new
    end
  end

  def show
    @daycare = Daycare.find(params[:id])
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :type, :summary)
  end
end
