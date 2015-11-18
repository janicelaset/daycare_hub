class Certification < ActiveRecord::Base
  belongs_to :daycare
  has_attached_file :image, styles: { small: "150x150>" }, default_url: ":style/cert.png"

  validates :name, :presence => true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  acts_as_list
end
