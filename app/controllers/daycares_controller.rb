class DaycaresController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_daycare, only: [:show, :update, :edit, :wizard]
  before_action :init_state

  def show
    @profile_page = true
    if @daycare.address.nil?  #if user has not added contact information
      @address = Address.new
    else
      @address = @daycare.address
      @address_json = @address.to_json
      # @listing = @daycare.listing
      # @listing_json = @daycare.listing.to_json
    end

    if @daycare.general.nil?
      @general = General.new
    else
      @general = @daycare.general
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
      @images = []
    else
      @images = @daycare.images.order("position")
      @image_first = @images.first
      @images = @images.drop(1)
    end

    if @daycare.programs.any? == false
      @program = Program.new
      @programs = []
    else
      @programs = @daycare.programs.order("position")
    end

    if @daycare.teachers.any? == false
      @teachers = Program.new
      @teachers = []
    else
      @teachers = @daycare.teachers.order("position")
    end

    if @daycare.certifications.any? == false
      @certification = Certification.new
      @certifications = []
    else
      @certifications = @daycare.certifications.order("list_order")
    end

    if @daycare.additionals.any? == false
      @additional = Additional.new
      @additionals = []
    else
      @additionals = @daycare.additionals.order("position")
    end

    @contact_form = ContactForm.new
  end

  def new
    @daycare = Daycare.new
  end

  def create
    @daycare = Daycare.new(daycare_params)
    @user = User.find(params[:user_id])
    @daycare.user = @user
    @daycare.save

    @listing = Listing.new(name: @daycare.name)
    @listing.daycare = @daycare
    @listing.save

    respond_to do |format|
      format.html
      format.js
    end

  end

  def edit
    @edit_page = true

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

    if @daycare.general.nil? #if user has not added address
      @general = General.new
    else
      @general = @daycare.general
    end

    if @daycare.images.any?
      @images = @daycare.images.order("position")
    else
      @images = []
    end
    @image = Image.new

    if @daycare.programs.any?
      @programs = @daycare.programs.order("position")
    else
      @programs = []
    end
    @program = Program.new

    if @daycare.certifications.any?
      @certifications = @daycare.certifications.order("list_order")
    else
      @certifications = []
    end
    @certification = Certification.new

    if @daycare.teachers.any?
      @teachers = @daycare.teachers.order("position")
    else
      @teachers = []
    end
    @teacher = Teacher.new

    if @daycare.additionals.any?
      @additionals = @daycare.additionals.order("position")
    else
      @additionals = []
    end
    @additional = Additional.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find(params[:user_id])
    @daycare.user = @user

    url_original = @daycare.url

    @daycare.update(daycare_params)

    listing = Listing.where(daycare_id: @daycare.id).first
    listing.update(name: daycare_params["name"])
    listing.save

    if @daycare.errors.any?
      if @daycare.errors.messages[:url] != nil
        @daycare.url = url_original
      end
    end

    respond_to do |format|
      if @daycare.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_address_user_daycare_path(@user, @daycare) }
      end
      format.js
    end
  end

  def wizard
    @wizard = true

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :url)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:id])
  end

  def init_state
    @edit_page = false
    @profile_page = false
    @wizard = false
  end
end
