class Daycare < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  has_many :images, :dependent => :destroy
  has_one :contact, :dependent => :destroy
  has_one :address, :dependent => :destroy
  has_many :teachers, :dependent => :destroy
  has_many :programs, :dependent => :destroy
  has_one :summary, :dependent => :destroy
  has_many :daycare_certifications, :dependent => :destroy
  has_many :certifications, :through => :daycare_certifications, :dependent => :destroy
  has_many :additionals, :dependent => :destroy
  has_one :general, :dependent => :destroy
  has_one :listing

  validates :name, :presence => true, length: { maximum: 55 }
  validates :url, :presence => true, length: { maximum: 55 }

  validates :url, uniqueness: {:message => " error: The web page address you entered is already taken. Please try a different web address."}
  validates :url, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  def to_param
    url || id
  end

end
