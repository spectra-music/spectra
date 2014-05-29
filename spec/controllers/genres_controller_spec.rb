require 'spec_helper'

describe GenresController, type: :controller do

  describe 'GET index' do
    it 'assigns all genres as @genres' do
      genre = create(:genre)
      get :index, {}
      expect(assigns(:genres)).to eq([genre])
    end

  end

  describe 'GET show' do
    it 'assigns the requested genre as @genre' do
      genre = create(:genre)
      get :show, {id: genre.to_param}
      expect(assigns(:genre)).to eq(genre)
    end
  end
end
