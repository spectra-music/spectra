require 'rails_helper'

RSpec.describe "flexlists/index", :type => :view do
  before(:each) do
    assign(:flexlists, [
      Flexlist.create!(
        :name => "Name"
      ),
      Flexlist.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of flexlists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
