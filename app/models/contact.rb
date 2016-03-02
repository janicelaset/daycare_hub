class Contact < ActiveRecord::Base
  belongs_to :daycare

  validates :phone, :presence => true
  validates :email, :presence => true, uniqueness: {:message => " error: The email address you entered is already taken."}
end
