require 'spec_helper'

describe 'artists/show', type: :view do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
      name: 'Name',
      rating: 1,
      slug: 'Slug'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Slug/)
  end
end
