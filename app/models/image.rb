class Image < ActiveRecord::Base
  belongs_to :daycare
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  def image_url
    picture.url(:thumb)
  end
end
