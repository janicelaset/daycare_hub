class Teacher < ActiveRecord::Base
  belongs_to :daycare

  validates :name, :presence => true
end
