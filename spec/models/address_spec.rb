require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to :contact }

  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip }
end
