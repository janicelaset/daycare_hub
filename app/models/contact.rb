class Contact < ActiveRecord::Base
  belongs_to :daycare

  validates :phone, :presence => true
  validates :email, :presence => true
end
