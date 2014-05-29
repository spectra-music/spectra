require 'spec_helper'

describe "genres/index", :type => :view do
  before(:each) do
    assign(:genres, [
      Genre.create!(),
      Genre.create!()
    ])
  end

  it "renders a list of genres" do
    render
  end
end
