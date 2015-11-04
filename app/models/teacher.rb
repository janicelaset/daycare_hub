class Teacher < ActiveRecord::Base
  belongs_to :daycare
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :name, :presence => true
end
