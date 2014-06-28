require 'spec_helper'

RSpec.describe "playlists/show", :type => :view do
  before(:each) do
    @playlist = assign(:playlist, Playlist.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
