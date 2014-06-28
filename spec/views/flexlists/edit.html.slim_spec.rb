require 'spec_helper'

RSpec.describe "flexlists/edit", :type => :view do
  before(:each) do
    @flexlist = assign(:flexlist, Flexlist.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit flexlist form" do
    render

    assert_select "form[action=?][method=?]", flexlist_path(@flexlist), "post" do

      assert_select "input#flexlist_name[name=?]", "flexlist[name]"
    end
  end
end
