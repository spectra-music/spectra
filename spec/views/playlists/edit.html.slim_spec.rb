require 'spec_helper'

RSpec.describe "playlists/edit", :type => :view do
  before(:each) do
    @playlist = assign(:playlist, Playlist.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit playlist form" do
    render

    assert_select "form[action=?][method=?]", playlist_path(@playlist), "post" do

      assert_select "input#playlist_name[name=?]", "playlist[name]"
    end
  end
end
