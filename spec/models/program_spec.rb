require 'rails_helper'

RSpec.describe Program, type: :model do
  it { should belong_to :daycare }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
end
