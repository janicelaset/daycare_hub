class Address < ActiveRecord::Base
  belongs_to :contact

  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true
end
