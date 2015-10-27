class Daycare < ActiveRecord::Base
  belongs_to :user
  has_many :images

  validates :name, :presence => true
end
