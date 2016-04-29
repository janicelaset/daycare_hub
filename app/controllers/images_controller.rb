class ImagesController < ApplicationController
  before_action :find_daycare
  before_action :find_user, only: [:create, :update]
  before_action :init_state

  def index
    if @daycare.images.any?
      @images = @daycare.images.order("position")
    else
      @images = []
    end
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.daycare = @daycare

    @image.save
    @images = @daycare.images

    #dropzone
    # if @image.save
    #   render json: { message: "success", fileID: @image.id }, :status => 200
    # else
    #   render json: { error: @image.errors.full_messages.join(',')}, :status => 400
    # end

    # if params[:image][:wizard]
    #   @wizard = true
    # end

    # binding.pry
    respond_to do |format|
      format.html
      format.js
    end

    #create new image to display create image form so users can add more images
    @image = Image.new
  end

  def edit
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)

    #for dropzone
    # if @image.update(image_params)
    #   render json: { message: "success", fileID: @image.id }, :status => 200
    # else
    #   render json: { error: @image.errors.full_messages.join(',')}, :status => 400
    # end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
  end

  def move
    #re-rendering images_list template to make sure edit form belongs
    #with same panel after sorting
    #need to change code to re-order nodes but this will work for now
    @images = @daycare.images

    params['image'].each_with_index do |id, index|
      image = Image.find(id)
      image.update_attribute(:position, index+1) if image
    end

    respond_to do |format|
      format.js
    end
  end

  def wizard
    @wizard = true
    @daycare = Daycare.find_by_url(params[:id])
    @images = @daycare.images
    @image = Image.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def image_params
    params.require(:image).permit(:picture, :description)
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
