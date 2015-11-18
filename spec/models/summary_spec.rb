require 'rails_helper'

RSpec.describe Summary, type: :model do
  it { should belong_to :daycare }

  it { should validate_presence_of :content }
end
