require 'rails_helper'

RSpec.describe Daycare, type: :model do
  it { should belong_to :user }
  it { should have_many :images }
  it { should have_one :contact }
  it { should have_one :address }
  it { should have_many :programs }
  it { should have_many :teachers }
  it { should have_many :certifications }
  it { should have_one :summary }

  it { should validate_presence_of :name }
end
