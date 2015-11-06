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
    @daycares = []
    in_state.each do |address|
      @destination.push(address.full_address)
      @daycares.push(address.daycare)
    end
@destination = in_state

    @destination = @destination.to_json
    @daycares = @daycares.to_json

  end

end
