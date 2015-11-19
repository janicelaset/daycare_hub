class SummariesController < ApplicationController
  def create
    @summary = Summary.new(summary_params)
    @daycare = Daycare.find(params[:daycare_id])
    @summary.daycare = @daycare

    @summary.save

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @summary = Summary.find(params[:id])
    @daycare = Daycare.find(params[:daycare_id])

    @summary.update(summary_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @daycare = Daycare.find(params[:daycare_id])
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
end
