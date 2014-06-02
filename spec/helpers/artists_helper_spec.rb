require 'spec_helper'

describe ArtistsHelper, type: :helper do
  it 'link_to_artist links to artist' do
    artist = FactoryGirl.create(:artist)
    expect(helper.link_to_artist(artist)).to eq(link_to(artist.name, artist))
  end
end
