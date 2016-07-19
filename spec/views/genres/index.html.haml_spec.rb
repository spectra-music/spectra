require 'rails_helper'

describe "genres/index", :type => :view do
  before(:each) do
    assign(:genres, [
      Genre.create!(
        :name => "Name",
        :slug => "Slug"
      ),
      Genre.create!(
        :name => "Name",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of genres" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
