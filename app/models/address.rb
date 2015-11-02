class Address < ActiveRecord::Base
  belongs_to :daycare

  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true
end
