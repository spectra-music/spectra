require 'spec_helper'

describe TracksHelper, type: :helper do
  it 'track_path should eq artist_album_track_path' do
    track = FactoryGirl.create(:track)
    expect(helper.track_path(track)).to \
      eq(artist_album_track_path(track.album.artist, track.album, track))
  end

  it 'track_url should eq artist_album_track_url' do
    track = FactoryGirl.create(:track)
    expect(helper.track_url(track)).to \
      eq(artist_album_track_url(track.album.artist, track.album, track))
  end
end
