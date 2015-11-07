class DaycaresController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @daycare = current_user.daycare

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

    if @daycare.images.nil?
      @image = Image.new
    end

  end

  def new
    @daycare = Daycare.new
  end

  def create
    @daycare = Daycare.new(daycare_params)
    @user = User.find(params[:user_id])
    @daycare.user = @user

    if @daycare.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      #process error
    end
  end

  def edit
    @daycare = Daycare.find(params[:id])

    if @daycare.contact.nil? #if user has not added contact information
      @contact = Contact.new
    else
      @contact = @daycare.contact
    end

    if @daycare.address.nil? #if user has not added address
      @address = Address.new
    else
      @address = @daycare.address
    end

    if @daycare.teachers.any? #if user has not added any teachers
      @teachers = @daycare.teachers.order("position")
    end

    @teacher = Teacher.new

    @image = Image.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find(params[:user_id])
    @daycare = Daycare.find(params[:id])
    @daycare.user = @user

    if @daycare.update(daycare_params)
      respond_to do |format|
        format.html
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    @daycare = Daycare.find(params[:id])
    @daycare.destroy

    redirect_to new_user_path(current_user)
  end

  private
  def daycare_params
    params.require(:daycare).permit(:name, :structure)
  end
end
