require 'spec_helper'

describe 'genres/index', type: :view do
  before(:each) do
    assign(:genres, [
      create(:genre),
      create(:genre, name: 'Pop')
    ])
  end

  it 'renders a list of genres' do
    render
  end
end
