class Program < ActiveRecord::Base
  belongs_to :daycare

  validates :name, :presence => true
  validates :description, :presence => true

  acts_as_list
end
