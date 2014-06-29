require 'spec_helper'

describe PlaylistTrack, type: :model do
  it { should belong_to(:playable) }
  it { should belong_to(:track) }

  it { should validate_uniqueness_of(:track_num).scoped_to(:playable_id) }
  it { should validate_numericality_of(:queue_id).is_equal_to(1).allow_nil }
end
