class DaycaresController < ApplicationController
  def show
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
      respond_to do |format|
        format.html
        format.js
      end
    else
      render 'users/new'
    end
  end

  def edit
    @daycare = Daycare.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find(params[:user_id])
    @daycare = Daycare.find(params[:id])
    @daycare.user = @user

    if @daycare.update(daycare_params)
      respond_to do |format|
        # format.html { redirect_to edit_user_path(@user) }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @daycare = Daycare.find(params[:id])
    @daycare.destroy

    redirect_to new_user_path(current_user)
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :structure)
  end
end
