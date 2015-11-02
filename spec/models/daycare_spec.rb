require 'rails_helper'

RSpec.describe Daycare, type: :model do
  it { should belong_to :user }
  it { should have_many :images }
  it { should have_one :contact }
  it { should have_one :address }

  it { should validate_presence_of :name }
end
