class Daycare < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_one :contact
  has_one :address
  has_many :teachers
  has_many :programs

  validates :name, :presence => true
end
