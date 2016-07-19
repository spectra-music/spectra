require 'rails_helper'

describe "albums/show", :type => :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :title => "Title",
      :rating => 1,
      :artist_id => 2,
      :is_compilation => false,
      :num_discs => 3,
      :slug => "Slug",
      :cover_file_name => "Cover File Name",
      :cover_content_type => "Cover Content Type",
      :cover_file_size => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Cover File Name/)
    expect(rendered).to match(/Cover Content Type/)
    expect(rendered).to match(/4/)
  end
end
