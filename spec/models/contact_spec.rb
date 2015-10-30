require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to :daycare }

  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :email }

end
