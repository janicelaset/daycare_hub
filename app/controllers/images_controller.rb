class ImagesController < ApplicationController
  def index
    @daycare = Daycare.find(params[:daycare_id])
    if @daycare.images.any?
      @images = @daycare.images.order("position")
    else
      @images = []
    end
    @image = Image.new
  end

  def create
    @daycare = Daycare.find(params[:daycare_id])
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

    #create new image to display create image form so users can add more images
    @image = Image.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @daycare = Daycare.find(params[:daycare_id])
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @image = Image.find(params[:id])
    @daycare = Daycare.find(params[:daycare_id])
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
    @daycare = Daycare.find(params[:daycare_id])

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

  private
  def image_params
    params.require(:image).permit(:picture, :description)
  end
end
