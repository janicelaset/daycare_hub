class Summary < ActiveRecord::Base
  belongs_to :daycare

  validates :content, :presence => true, length: { maximum: 255 }

end
