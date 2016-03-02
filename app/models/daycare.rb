class Daycare < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_one :contact
  has_one :address
  has_many :teachers
  has_many :programs
  has_one :summary
  has_many :certifications
  has_many :additionals
  has_one :general

  validates :name, :presence => true, length: { maximum: 55 }
  validates :url, :presence => true, length: { maximum: 55 }

  validates :url, uniqueness: {:message => " error: The URL you entered is already taken. Please try a different URL."}
  validates :url, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  def to_param
    url || id
  end

end
