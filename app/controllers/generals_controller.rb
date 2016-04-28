class GeneralsController < ApplicationController
  before_action :find_daycare
  before_action :find_user, only: [:create, :update]
  before_action :init_state

  def create
    @general = General.new(general_params)
    @general.daycare = @daycare

    @general.save
    respond_to do |format|
      if @general.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_summary_user_daycare_path(@user, @daycare) }
      end
      format.js
    end
  end

  def update
    @general = General.find(params[:id])

    @general.update(general_params)
    respond_to do |format|
      if @general.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_summary_user_daycare_path(@user, @daycare) }
      end
      format.js
    end
  end

  def wizard
    @wizard = true

    @daycare = Daycare.find_by_url(params[:id])

    if @daycare.general.nil?  #if user has not added general information
      @general = General.new
    else
      @general = @daycare.general
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

private
  def general_params
    params.require(:general).permit(:license, :type_of_daycare, :year_opened)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end

  def find_user
    @user = @daycare.user
  end

  def init_state
    @wizard = false
  end
end
