class Contact < ActiveRecord::Base
  belongs_to :daycare
  has_one :address

  validates :phone, :presence => true
  validates :email, :presence => true
end
