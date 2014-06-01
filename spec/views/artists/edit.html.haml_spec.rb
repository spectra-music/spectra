require 'spec_helper'

describe "artists/edit", :type => :view do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
      :name => "MyString",
      :rating => 1,
      :slug => "MyString"
    ))
  end

  it "renders the edit artist form" do
    render

    assert_select "form[action=?][method=?]", artist_path(@artist), "post" do

      assert_select "input#artist_name[name=?]", "artist[name]"

      assert_select "input#artist_rating[name=?]", "artist[rating]"

      assert_select "input#artist_slug[name=?]", "artist[slug]"
    end
  end
end
