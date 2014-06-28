require 'spec_helper'

RSpec.describe "flexlists/show", :type => :view do
  before(:each) do
    @flexlist = assign(:flexlist, Flexlist.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
