class HomeController < ApplicationController
  def index
  end

  def geocoding
    respond_to do |format|
      format.js
    end
  end

  def reverse_geocoding
    respond_to do |format|
      format.js
    end
  end

  def show
    @address = params[:search]
    @radius = params["radius-value"]

    @destination = Address.where("state = 'OR'")

    @daycares = []
    @images = []
    @destination.each do |address|
      @daycares.push(address.daycare)
      if address.daycare.images.any?
        image = address.daycare.images.first.image_url
      else
        image = nil
      end
      @images.push(image)
    end
    @destination = @destination.to_json
    @daycares = @daycares.to_json
    @images = @images.to_json
  end

end
