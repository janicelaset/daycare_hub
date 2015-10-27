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
end
