class Additional < ActiveRecord::Base
  belongs_to :daycare
  has_attached_file :image, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: ":style/addtl.png"

  validates :title, :presence => true
  validates :content, :presence => true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # sets position attribute of new additional info
  acts_as_list
end
