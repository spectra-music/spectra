require 'spec_helper'

describe "tracks/show", :type => :view do
  before(:each) do
    @track = assign(:track, Track.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Format/)
    expect(rendered).to match(/Slug/)
  end
end
