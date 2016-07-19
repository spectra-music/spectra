require 'rails_helper'

describe "genres/edit", :type => :view do
  before(:each) do
    @genre = assign(:genre, Genre.create!(
      :name => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders the edit genre form" do
    render

    assert_select "form[action=?][method=?]", genre_path(@genre), "post" do

      assert_select "input#genre_name[name=?]", "genre[name]"

      assert_select "input#genre_slug[name=?]", "genre[slug]"
    end
  end
end
