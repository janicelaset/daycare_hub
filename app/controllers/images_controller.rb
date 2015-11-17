class ImagesController < ApplicationController
  def create
    @daycare = Daycare.find(params[:daycare_id])
    @image = Image.new(image_params)
    @image.daycare = @daycare

    @image.save

    #create new image to display create image form so users can add more images
    @image = Image.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
  end

  private
  def image_params
    params.require(:image).permit(:picture, :description)
  end
end
