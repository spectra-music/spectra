require 'rails_helper'

describe "artists/new", :type => :view do
  before(:each) do
    assign(:artist, Artist.new(
      :name => "MyString",
      :rating => 1,
      :slug => "MyString"
    ))
  end

  it "renders new artist form" do
    render

    assert_select "form[action=?][method=?]", artists_path, "post" do

      assert_select "input#artist_name[name=?]", "artist[name]"

      assert_select "input#artist_rating[name=?]", "artist[rating]"

      assert_select "input#artist_slug[name=?]", "artist[slug]"
    end
  end
end
