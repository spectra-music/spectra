require 'spec_helper'

describe Playlist, type: :model do
  it { should have_many(:playlist_tracks) }
  it { should have_many(:tracks).through(:playlist_tracks) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }

  context 'when adding tracks' do
    subject(:playlist) { create(:playlist) }
    it 'should allow adding a single track' do
      track = create(:track)

      playlist.add(track)
      expect(playlist.tracks).to include(track)
    end

    it 'should allow adding albums' do
      album = create(:album_with_tracks)
      playlist.add(album)
      expect(playlist.tracks).to eq(album.tracks)
    end

    it 'should allow adding artists' do
      album = create(:album_with_tracks)
      playlist.add(album.artist)
      expect(playlist.tracks).to eq(album.artist.tracks)
    end
  end
end
