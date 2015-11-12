class Program < ActiveRecord::Base
  belongs_to :daycare
  has_attached_file :picture, styles: { medium: "800x600>" }, default_url: ":style/program.png"

  validates :name, :presence => true
  validates :description, :presence => true
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  acts_as_list
end
