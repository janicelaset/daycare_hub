class Listing < ActiveRecord::Base
  # attr_accessible :street, :city, :state, :zip, :latitude, :longitude
  geocoded_by :full_address
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :geocode

  def full_address
    "#{street}, #{city}, #{state} #{zip}"
  end

end
