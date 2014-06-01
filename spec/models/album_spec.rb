require 'spec_helper'

describe Album, type: :model do
  it { should have_many(:tracks) }
  it { should belong_to(:artist) }
  it { should have_and_belong_to_many(:genres) }

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
              .is_less_than_or_equal_to(5) }
  it { should_not allow_value(nil).for(:rating) }

  it { should validate_numericality_of(:num_discs)
              .only_integer
              .is_greater_than(0) }

  it { should allow_value(nil).for(:num_discs) }

  describe 'with tracks' do
    subject { create(:album_with_tracks) }
    it { should delegate_method(:num_tracks).to(:tracks).as(:count) }
    it { should delegate_method(:average_rating).to(:tracks).as(:average) }
  end
end