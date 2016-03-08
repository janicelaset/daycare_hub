class HomeController < ApplicationController
  def index
    @feedback_form = FeedbackForm.new
  end

  def show
    @address = params[:search]
    address_split = @address.split(', ')
    @radius = params["radius-value"]
    # @family = params["family"]
    # @center = params["center"]
    # @licensed = params["licensed"]
    #
    # destination = Address.where(state: address_split[2])
#     daycares = []
#     generals = []
#     destination.each do |address|
#       daycares.push(address.daycare)
#     end
#     daycares.each do |daycare|
#       generals.push(daycare.general)
#     end
# binding.pry
#     generals = generals.select{ |general| general.type_of_daycare == 'center' }
# binding.pry

    @destination = Address.where(state: address_split[2])
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

    respond_to do |format|
      format.html
      format.js
    end

  end

end
