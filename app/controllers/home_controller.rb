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

    in_state = Address.where("state = 'OR'")
    @destination = []
    in_state.each do |address|
      @destination.push(address.full_address)
    end

    # @link = "https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=drawing,places&callback=displaySearchResults(#{@address, @radius, @destination})"
stuff = in_state.to_json

    # respond_to do |format|
    #   format.js
    # end
  end

end
