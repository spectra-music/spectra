require 'spec_helper'

describe AlbumsHelper, type: :helper do
  it 'album_path should eq artist_album_path' do
    album = FactoryGirl.create(:album)
    expect(helper.album_path(album)).to eq(artist_album_path(album.artist, album))
  end

  it 'album_url should eq artist_album_track_url' do
    album = FactoryGirl.create(:album)
    expect(helper.album_url(album)).to eq(artist_album_url(album.artist, album))
  end

  it 'link_to_album should link_to album' do
    album = FactoryGirl.create(:album)
    expect(link_to_album(album)).to eq(link_to(album.name, artist_album_path(album.artist, album)))
  end
end
