require 'spec_helper'

describe ArtistsController, type: :controller do
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArtistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all artists as @artists' do
      artist = create(:artist)
      get :index, {}, valid_session
      expect(assigns(:artists)).to eq([artist])
    end
  end

  describe 'GET show' do
    it 'assigns the requested artist as @artist' do
      artist = create(:artist)
      get :show, {id: artist.to_param}, valid_session
      expect(assigns(:artist)).to eq(artist)
    end
  end

  # For artists#update, we only deal with :json
  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested artist' do
        artist = create(:artist)
        expect_any_instance_of(Artist).to receive(:update).with({ 'rating' => '1'})
        put :update, {id: artist.to_param, artist: {'rating' => '1'}, format: :json}, valid_session
      end

      it 'assigns the requested artist as @artist' do
        artist = create(:artist)
        put :update, {id: artist.to_param, artist: attributes_for(:artist), format: :json}, valid_session
        expect(assigns(:artist)).to eq(artist)
      end
    end

    describe 'with invalid params' do
      it 'assigns the artist as @artist' do
        artist = create(:artist)
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Artist).to receive(:update).and_return(false)
        put :update, {id: artist.to_param, artist: {'rating' => '-2'}, format: :json}, valid_session
        expect(assigns(:artist)).to eq(artist)
      end
    end
  end
end
