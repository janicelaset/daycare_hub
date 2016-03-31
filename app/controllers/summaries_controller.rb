class SummariesController < ApplicationController
  before_action :find_daycare, except: [:destroy]
  before_action :find_user, only: [:create, :update]

  def create
    @summary = Summary.new(summary_params)
    @summary.daycare = @daycare

    @summary.save
    respond_to do |format|
      if @summary.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_image_user_daycare_path(@user, @daycare) }
      end
      format.js
    end
  end

  def update
    @summary = Summary.find(params[:id])

    @summary.update(summary_params)
    respond_to do |format|
      if @summary.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_image_user_daycare_path(@user, @daycare) }
      end
      format.js
    end
  end

  def destroy
    @summary = Summary.find(params[:id])
    @summary.destroy

    @summary = Summary.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def wizard
    @daycare = Daycare.find_by_url(params[:id])

    if @daycare.summary.nil?  #if user has not added summary information
      @summary = Summary.new
    else
      @summary = @daycare.summary
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def summary_params
    params.require(:summary).permit(:content)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end

  def find_user
    @user = @daycare.user
  end
end
