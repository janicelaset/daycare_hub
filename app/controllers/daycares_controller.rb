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

  def edit
    @daycare = Daycare.find(params[:id])
  end

  def update
    @daycare = Daycare.find(params[:id])
    if @daycare.update(daycare_params)
      redirect_to daycare_path(@daycare)
    else
      render :edit
    end
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :structure, :summary)
  end
end
