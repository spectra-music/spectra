require 'spec_helper'

describe "albums/index", :type => :view do
  before(:each) do
    assign(:albums, [
      Album.create!(
        :title => "Title",
        :rating => 1,
        :artist_id => 2,
        :is_compilation => false,
        :num_discs => 3,
        :slug => "Slug",
        :cover_file_name => "Cover File Name",
        :cover_content_type => "Cover Content Type",
        :cover_file_size => 4
      ),
      Album.create!(
        :title => "Title",
        :rating => 1,
        :artist_id => 2,
        :is_compilation => false,
        :num_discs => 3,
        :slug => "Slug",
        :cover_file_name => "Cover File Name",
        :cover_content_type => "Cover Content Type",
        :cover_file_size => 4
      )
    ])
  end

  it "renders a list of albums" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Cover File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cover Content Type".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
