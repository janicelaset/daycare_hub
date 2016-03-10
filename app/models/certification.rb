class Certification < ActiveRecord::Base
  has_many :daycare_certifications
  has_many :daycares, :through => :daycare_certifications
  has_attached_file :image, styles: { small: "150x150>" }, default_url: ":style/cert.png"

  validates :name, :presence => true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  acts_as_list
end
