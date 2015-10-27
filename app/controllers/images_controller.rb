class ImagesController < ApplicationController
  def index
    @images = current_user.daycare.images
  end


  def new
    @daycare = current_user.daycare
    @image = Image.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @daycare = Daycare.find(params[:daycare_id])
    @image = Image.new(image_params)
    @image.daycare = @daycare

    if @image.save
      redirect_to edit_user_path(current_user)
    else
      flash[:notice] = "Image not saved"
    end
  end

  private
  def image_params
    params.require(:image).permit(:picture, :description)
  end
end
