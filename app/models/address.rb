class Address < ActiveRecord::Base
  # attr_accessible :street, :city, :state, :zip, :latitude, :longitude
  attr_reader :full_address
  belongs_to :daycare

  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true

  def full_address
    "#{street}, #{city}, #{state} #{zip}"
  end

end
