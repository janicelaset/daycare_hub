class UsersController < ApplicationController
  def show
    @daycare = current_user.daycare
  end

  def new
    @daycare = Daycare.new
  end

  def edit
    @daycare = Daycare.find(params[:id])
  end
end
