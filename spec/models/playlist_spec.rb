require 'spec_helper'

describe Playlist, type: :model do
  it { should have_many(:playlist_tracks) }
  it { should have_many(:tracks).through(:playlist_tracks) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end
