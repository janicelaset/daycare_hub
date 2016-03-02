class SummariesController < ApplicationController
  before_action :find_daycare, except: [:destroy]

  def create
    @summary = Summary.new(summary_params)
    @summary.daycare = @daycare

    @summary.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @summary = Summary.find(params[:id])
    
    @summary.update(summary_params)
    respond_to do |format|
      format.html
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

  private
  def summary_params
    params.require(:summary).permit(:content)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end
end
