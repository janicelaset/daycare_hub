class CertificationsController < ApplicationController
  before_action :find_daycare, except: [:destroy]

  def create
    if cert_params.has_key? :name
      @certification = Certification.new(cert_params)
    else
      @certification = Certification.find(cert_params['id'])
    end
    @certification.daycare = @daycare
    @certification.save
binding.pry
    @certifications = @daycare.certifications.order("position")

    #create new certification to display create certification form so users can add more programs
    @certification = Certification.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @certification = Certification.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @certification = Certification.find(params[:id])
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
    params['certification'].each_with_index do |id, index|
      certification = Certification.find(id)
      certification.update_attribute(:position, index+1) if certification
    end

    #re-rendering certifications_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    @certifications = @daycare.certifications.order("positions")

    respond_to do |format|
      format.js
    end
  end

  private
  def cert_params
    params.require(:certification).permit(:certification, :name, :description, :link, :image, :id, :position)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end
end
