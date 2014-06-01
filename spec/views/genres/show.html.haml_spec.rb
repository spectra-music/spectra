require 'spec_helper'

describe 'genres/show', type: :view do
  before(:each) do
    @genre = assign(:genre, Genre.create!(
      name: 'Name',
      slug: 'Slug'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Slug/)
  end
end
