require 'spec_helper'

describe PlaylistTrack, type: :model do
  it { should belong_to(:playable) }
  it { should belong_to(:track) }

  it {should validate_uniqueness_of(:track_num).scoped_to(:playable_id) }
end
