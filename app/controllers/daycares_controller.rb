class DaycaresController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @daycare = Daycare.find(params[:id])

    if @daycare.address.nil?  #if user has not added contact information
      @address = Address.new
    else
      @address = @daycare.address
    end

    if @daycare.contact.nil?  #if user has not added contact information
      @contact = Contact.new
    else
      @contact = @daycare.contact
    end

    if @daycare.summary.nil?
      @summary = Summary.new
    else
      @summary = @daycare.summary
    end

    if @daycare.images.any? == false
      @image = Image.new
    else
      @daycare.images = @daycare.images.order("position")
      @images = @daycare.images.order("position")
    end

    @daycare.programs = @daycare.programs.order("position")
    @programs = @daycare.programs.order("position")

    @daycare.teachers = @daycare.teachers.order("position")
    @teachers = @daycare.teachers.order("position")
    # if @daycare.teachers.any?
    #   @teachers = @daycare.teachers.order("position")
    # end

    if @daycare.certifications.any? == false
      @certification = Certification.new
    else
      @certifications = @daycare.certifications
    end
  end

  def new
    @daycare = Daycare.new
  end

  def create
    @daycare = Daycare.new(daycare_params)
    @user = User.find(params[:user_id])
    @daycare.user = @user

    @daycare.save
    respond_to do |format|
      format.html
      format.js
    end

  end

  def edit
    @daycare = Daycare.find(params[:id])

    if @daycare.contact.nil? #if user has not added contact information
      @contact = Contact.new
    else
      @contact = @daycare.contact
    end

    if @daycare.summary.nil?
      @summary = Summary.new
    else
      @summary = @daycare.summary
    end

    if @daycare.address.nil? #if user has not added address
      @address = Address.new
    else
      @address = @daycare.address
    end

    if @daycare.images.any?
      @images = @daycare.images.order("position")
    end
    @image = Image.new

    @program = Program.new

    @certification = Certification.new

    if @daycare.teachers.any?
      @teachers = @daycare.teachers.order("position")
    end

    @teacher = Teacher.new

    @additional = Additional.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find(params[:user_id])
    @daycare = Daycare.find(params[:id])
    @daycare.user = @user

    @daycare.update(daycare_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :structure)
  end
end
