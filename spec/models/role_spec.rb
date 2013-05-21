require 'spec_helper'

describe Role do
  it { should have_many(:candidates) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end
