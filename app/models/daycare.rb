class Daycare < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_one :contact
  has_one :address
  has_many :teachers
  has_many :programs
  has_one :summary
  has_many :certifications

  validates :name, :presence => true
end
