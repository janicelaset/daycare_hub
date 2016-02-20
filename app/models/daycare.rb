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

  validates :name, :presence => true
  validates :url, :presence => true

  validates :url, uniqueness: true
  validates :url, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  def to_param
    url || id
  end

end
