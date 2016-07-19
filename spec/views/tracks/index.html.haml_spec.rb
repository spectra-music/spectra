require 'rails_helper'

describe "tracks/index", :type => :view do
  before(:each) do
    assign(:tracks, [
      Track.create!(
        :title => "Title",
        :rating => 1,
        :artist_id => 2,
        :album_id => 3,
        :location => "Location",
        :bitrate => 1.5,
        :lyrics => "MyText",
        :track_id => 4,
        :disc_id => 5,
        :format => "Format",
        :slug => "Slug"
      ),
      Track.create!(
        :title => "Title",
        :rating => 1,
        :artist_id => 2,
        :album_id => 3,
        :location => "Location",
        :bitrate => 1.5,
        :lyrics => "MyText",
        :track_id => 4,
        :disc_id => 5,
        :format => "Format",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of tracks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Format".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
