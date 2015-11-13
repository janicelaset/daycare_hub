class ImagesController < ApplicationController
  def index
    # @images = current_user.daycare.images
    #
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def new
    # @daycare = current_user.daycare
    # @image = Image.new
    #
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def create
    @daycare = Daycare.find(params[:daycare_id])
    @image = Image.new(image_params)
    @image.daycare = @daycare

    @image.save

    redirect_to edit_user_daycare_path(current_user, @daycare)

  end

  private
  def image_params
    params.require(:image).permit(:picture, :description)
  end
end
