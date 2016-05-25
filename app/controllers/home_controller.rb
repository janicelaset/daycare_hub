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

    # @destination = Listing.where(state: address_split[2])
    # @destination.each do |listing|
    #   if listing.daycare_id?
    #     daycare = Daycare.find(listing.daycare_id)
    #     if daycare.images.any?
    #       image = daycare.images.first.image_url
    #     else
    #       image = nil
    #     end
    #   else
    #     image = nil
    #   end
    #   @images.push(image)
    # end

    @listings = Listing.near(@address, @radius)

    @listings.each do |listing|
      listing.image_url = 'Brick.png'
      if listing.daycare_id?
        daycare = Daycare.find(listing.daycare_id)
        if daycare.images.any?
          listing.image_url = daycare.images.first.image_url
        end
      end
    end

    # @listings = []
    @listings = @listings.to_json

    respond_to do |format|
      format.html
      format.js
    end
  end

  def about
  end

  def parent
  end

  def daycare
  end
end
