require 'rails_helper'

describe "artists/index", :type => :view do
  before(:each) do
    assign(:artists, [
      Artist.create!(
        :name => "Name",
        :rating => 1,
        :slug => "Slug"
      ),
      Artist.create!(
        :name => "Name",
        :rating => 1,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of artists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
