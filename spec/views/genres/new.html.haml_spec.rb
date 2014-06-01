require 'spec_helper'

describe 'genres/new', type: :view do
  before(:each) do
    assign(:genre, Genre.new(
      name: 'MyString',
      slug: 'MyString'
    ))
  end

  it 'renders new genre form' do
    render

    assert_select 'form[action=?][method=?]', genres_path, 'post' do

      assert_select 'input#genre_name[name=?]', 'genre[name]'

      assert_select 'input#genre_slug[name=?]', 'genre[slug]'
    end
  end
end
