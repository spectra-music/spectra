require 'spec_helper'

describe "genres/edit", :type => :view do
  before(:each) do
    @genre = assign(:genre, Genre.create!())
  end

  it "renders the edit genre form" do
    render

    assert_select "form[action=?][method=?]", genre_path(@genre), "post" do
    end
  end
end
