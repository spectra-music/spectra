require 'rails_helper'

RSpec.describe "flexlists/new", :type => :view do
  before(:each) do
    assign(:flexlist, Flexlist.new(
      :name => "MyString"
    ))
  end

  it "renders new flexlist form" do
    render

    assert_select "form[action=?][method=?]", flexlists_path, "post" do

      assert_select "input#flexlist_name[name=?]", "flexlist[name]"
    end
  end
end
