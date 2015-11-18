require 'rails_helper'

RSpec.describe Certification, type: :model do
  it { should belong_to :daycare }

  it { should validate_presence_of :name }
end
