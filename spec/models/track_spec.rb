require 'spec_helper'

describe Track do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:artist) }
  it { should validate_presence_of(:album) }
  it { should validate_presence_of(:track_id) }
  it { should validate_presence_of(:location) }

  # it 'should require case sensitive unique value for track_id scoped to album' do
  #   create(:track)
  #   validate_uniqueness_of(:title).case_insensitive.scoped_to(:album)
  # end

  # it { should validate_associated(:album) }
  # it { should validate_associated(:artist) }

  it { should validate_numericality_of(:track_id)
              .only_integer
              .is_greater_than_or_equal_to(1) }

  # it 'should require unique value for title scoped to album' do
  #   create(:track)
  #   should validate_uniqueness_of(:track_id)#.scoped_to(:album)
  # end

  it { should validate_numericality_of(:disc_id)
              .only_integer
              .is_greater_than_or_equal_to(1)
              .allow_nil }

  it { should validate_uniqueness_of(:location) }
end

