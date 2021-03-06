class CertificationsController < ApplicationController
  before_action :find_daycare
  before_action :find_user, only: [:create, :update]
  before_action :init_state

  def create
    if cert_params.has_key? :name
      @certification = Certification.new(cert_params)
      @certification.state = @daycare.address.state
      @certification.created_by = @daycare.id
    else
      @certification = Certification.find(cert_params['id'])
    end
    @certification.save

    daycare_certification = DaycareCertification.new(daycare: @daycare, certification: @certification)
    daycare_certification.save

    @certifications = @daycare.certifications

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

  # def update
  #   @certification = Certification.find(params[:id])
  #   @certifications = @daycare.certifications
  #
  #   @certification.update(cert_params)
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end

  def destroy
    @cert_deleted = Certification.find(params[:id])
    @certifications = @daycare.certifications

    daycare_certification = DaycareCertification.where("daycare_id = ? AND certification_id = ?", @daycare.id, @cert_deleted.id)
    daycare_certification.first.destroy

    #create new certification to display create certification form so users can add more programs
    @certification = Certification.new
  end

  def move
    params['certification'].each_with_index do |id, index|
      certification = Certification.find(id)
      certification.update_attribute(:position, index + 1) if certification

      cert = DaycareCertification.where("certification_id = ? AND daycare_id = ?", id, @daycare.id).first
      cert.update_attribute(:list_order, index + 1) if cert
    end
    #re-rendering certifications_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    @certifications = @daycare.certifications

    respond_to do |format|
      format.js
    end
  end

  def wizard
    @wizard = true
    @daycare = Daycare.find_by_url(params[:id])
    @certifications = @daycare.certifications
    @certification = Certification.new

    respond_to do |format|
      format.html
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

  def find_user
    @user = @daycare.user
  end

  def init_state
    @wizard = false
  end
end
