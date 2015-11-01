class Address < ActiveRecord::Base
  belongs_to :contact

  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true
end
