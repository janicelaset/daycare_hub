class Teacher < ActiveRecord::Base
  belongs_to :daycare
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: ":style/teacher.png"

  validates :name, :presence => true
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  # sets position attribute of new teachers
  acts_as_list
end
