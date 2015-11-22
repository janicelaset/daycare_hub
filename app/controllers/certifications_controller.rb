class CertificationsController < ApplicationController
  def create
    @certification = Certification.new(cert_params)
    @daycare = Daycare.find(params[:daycare_id])
    @certification.daycare = @daycare

    @certification.save

    #create new certification to display create certification form so users can add more programs
    @certification = Certification.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    binding.pry
    @certification = Certification.find(params[:id])
    @certification.destroy
  end

  private
  def cert_params
    params.require(:certification).permit(:name, :description, :image, :id, :position)
  end
end
