class Contact < ActiveRecord::Base
  belongs_to :daycare

  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
end
