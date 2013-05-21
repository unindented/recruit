require 'spec_helper'

describe Candidate do
  it { should belong_to(:role) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
end

