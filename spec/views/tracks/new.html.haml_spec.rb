require 'spec_helper'

describe "tracks/new", :type => :view do
  before(:each) do
    assign(:track, Track.new(
      :title => "MyString",
      :rating => 1,
      :artist_id => 1,
      :album_id => 1,
      :location => "MyString",
      :bitrate => 1.5,
      :lyrics => "MyText",
      :track_id => 1,
      :disc_id => 1,
      :format => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders new track form" do
    render

    assert_select "form[action=?][method=?]", tracks_path, "post" do

      assert_select "input#track_title[name=?]", "track[title]"

      assert_select "input#track_rating[name=?]", "track[rating]"

      assert_select "input#track_artist_id[name=?]", "track[artist_id]"

      assert_select "input#track_album_id[name=?]", "track[album_id]"

      assert_select "input#track_location[name=?]", "track[location]"

      assert_select "input#track_bitrate[name=?]", "track[bitrate]"

      assert_select "textarea#track_lyrics[name=?]", "track[lyrics]"

      assert_select "input#track_track_id[name=?]", "track[track_id]"

      assert_select "input#track_disc_id[name=?]", "track[disc_id]"

      assert_select "input#track_format[name=?]", "track[format]"

      assert_select "input#track_slug[name=?]", "track[slug]"
    end
  end
end
