require 'spec_helper'

describe Album do
  it { should have_many(:tracks) }
  it { should belong_to(:artist) }


  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:artist) }

  it { should validate_uniqueness_of(:title).case_insensitive}

  # This shoulda_matcher validation doesn't exist yet
  #it { should validate_associated(:artist)}

  it { should allow_value(true).for(:is_compilation) }
  it { should allow_value(false).for(:is_compilation) }
  it { should_not allow_value(nil).for(:is_compilation)}

  it { should validate_numericality_of(:rating)
              .only_integer
              .is_greater_than_or_equal_to(0)
              .is_less_than_or_equal_to(5)
              .allow_nil }

  it { should validate_numericality_of(:num_discs)
              .only_integer
              .is_greater_than(0) }

  it { should validate_numericality_of(:num_tracks)
              .only_integer
              .is_greater_than(0)}
end