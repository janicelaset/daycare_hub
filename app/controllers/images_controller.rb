class ImagesController < ApplicationController
  def create
    @daycare = Daycare.find(params[:daycare_id])
    @image = Image.new(image_params)
    @image.daycare = @daycare

    @image.save
    @images = @daycare.images

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

    params['image'].each_with_index do |id, index|
      image = Image.find(id)
      image.update_attribute(:position, index+1) if image
    end
    render nothing: true
  end

  private
  def image_params
    params.require(:image).permit(:picture, :description)
  end
end
