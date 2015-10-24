class DaycaresController < ApplicationController
  def new
    @daycare = Daycare.new
  end

  def show
    @daycare = Daycare.find(params[:id])
  end

  def create
    @daycare = Daycare.new(daycare_params)
    @user = User.find(params[:user_id])
    @daycare.user = @user

    if @daycare.save
      redirect_to user_daycare_path(@user, @daycare)
    else
      render :new
    end
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :structure)
  end
end
