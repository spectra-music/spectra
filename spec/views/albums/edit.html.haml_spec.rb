require 'spec_helper'

describe "albums/edit", :type => :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :title => "MyString",
      :rating => 1,
      :artist_id => 1,
      :is_compilation => false,
      :num_discs => 1,
      :slug => "MyString",
      :cover_file_name => "MyString",
      :cover_content_type => "MyString",
      :cover_file_size => 1
    ))
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "input#album_title[name=?]", "album[title]"

      assert_select "input#album_rating[name=?]", "album[rating]"

      assert_select "input#album_artist_id[name=?]", "album[artist_id]"

      assert_select "input#album_is_compilation[name=?]", "album[is_compilation]"

      assert_select "input#album_num_discs[name=?]", "album[num_discs]"

      assert_select "input#album_slug[name=?]", "album[slug]"

      assert_select "input#album_cover_file_name[name=?]", "album[cover_file_name]"

      assert_select "input#album_cover_content_type[name=?]", "album[cover_content_type]"

      assert_select "input#album_cover_file_size[name=?]", "album[cover_file_size]"
    end
  end
end
