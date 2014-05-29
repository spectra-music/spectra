require 'spec_helper'

describe Artist, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_numericality_of(:rating)
              .only_integer
              .is_greater_than_or_equal_to(0)
              .is_less_than_or_equal_to(5)
              .allow_nil }
end

