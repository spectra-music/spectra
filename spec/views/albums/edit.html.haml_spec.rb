require 'spec_helper'

describe 'albums/edit', type: :view do
  before :each do
    @album = assign(:album, create(:album))
  end

  it 'renders the edit album form' do
    render

    assert_select 'form[action=?][method=?]', album_path(@album), 'post' do
      assert_select 'input#album_title[name=?]', 'album[title]'
      assert_select 'input#album_rating[name=?]', 'album[rating]'
      assert_select 'input#album_artist[name=?]', 'album[artist]'
      assert_select 'input#album_is_compilation[name=?]',
                    'album[is_compilation]'
      assert_select 'input#album_num_discs[name=?]', 'album[num_discs]'
    end
  end
end
