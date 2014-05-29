require 'spec_helper'

describe 'genres/show', :type => :view do
  before(:each) do
    @genre = assign(:genre, create(:genre))
  end

  it 'renders attributes in <p>' do
    render
  end
end
