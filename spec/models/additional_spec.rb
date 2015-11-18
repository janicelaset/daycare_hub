require 'rails_helper'

RSpec.describe Additional, type: :model do
  it { should belong_to :daycare }

  it { should validate_presence_of :title }
  it { should validate_presence_of :content }

end
