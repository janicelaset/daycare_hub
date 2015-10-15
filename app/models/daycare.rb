class Daycare < ActiveRecord::Base
  validates :name, :presence => true
end
