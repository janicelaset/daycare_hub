class Daycare < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_one :contact
  has_one :address
  has_many :teachers

  validates :name, :presence => true
end
