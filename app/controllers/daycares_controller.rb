class DaycaresController < ApplicationController
  def new
    @daycare = Daycare.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def view
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @daycare = Daycare.new(daycare_params)
    @user = User.find(params[:user_id])
    @daycare.user = @user

    if @daycare.save
      # respond_to do |format|
      #   format.html { redirect_to edit_user_path(@user) }
      #   format.js
      # end
      redirect_to edit_user_path(@user)
    else
      render 'users/new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @daycare = Daycare.find(params[:id])

    if @daycare.update(daycare_params)
      redirect_to user_daycare_path(@user, @daycare)
    else
      render :edit
    end
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :structure)
  end
end
