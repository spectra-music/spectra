require 'spec_helper'

describe "genres/new", :type => :view do
  before(:each) do
    assign(:genre, Genre.new())
  end

  it "renders new genre form" do
    render

    assert_select "form[action=?][method=?]", genres_path, "post" do
    end
  end
end
