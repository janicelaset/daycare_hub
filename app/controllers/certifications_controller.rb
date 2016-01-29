class CertificationsController < ApplicationController
  def create
    @certification = Certification.new(cert_params)
    @daycare = Daycare.find(params[:daycare_id])
    @certification.daycare = @daycare
    @certification.save

    @certifications = @daycare.certifications

    #create new certification to display create certification form so users can add more programs
    @certification = Certification.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @daycare = Daycare.find(params[:daycare_id])
    @certification = Certification.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @certification = Certification.find(params[:id])
    @daycare = Daycare.find(params[:daycare_id])
    @certifications = @daycare.certifications

    @certification.update(cert_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @certification = Certification.find(params[:id])
    @certification.destroy
  end

  def move
    @daycare = Daycare.find(params[:daycare_id])

    #re-rendering programs_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    @certifications = @daycare.programs

    params['certification'].each_with_index do |id, index|
      certification = Certification.find(id)
      certification.update_attribute(:position, index+1) if certification
    end

    respond_to do |format|
      format.js
    end
  end

  private
  def cert_params
    params.require(:certification).permit(:name, :description, :link, :image, :id, :position)
  end
end
