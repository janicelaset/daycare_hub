class Daycare < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_one :contact

  validates :name, :presence => true
end
