require 'spec_helper'


describe AlbumsController, type: :controller do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AlbumsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all albums as @albums' do
      album = create(:album)
      get :index, {}, valid_session
      expect(assigns(:albums)).to eq([album])
    end
  end

  describe 'GET show' do
    it 'assigns the requested album as @album' do
      album = create(:album)
      get :show, {id: album.to_param}, valid_session
      expect(assigns(:album)).to eq(album)
    end
  end


  describe "GET edit" do
    it "assigns the requested album as @album" do
      album = Album.create! valid_attributes
      get :edit, {:id => album.to_param}, valid_session
      expect(assigns(:album)).to eq(album)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested album" do
        album = Album.create! valid_attributes
        # Assuming there are no other albums in the database, this
        # specifies that the Album created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Album).to receive(:update).with({ "title" => "MyString" })
        put :update, {:id => album.to_param, :album => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested album as @album" do
        album = Album.create! valid_attributes
        put :update, {:id => album.to_param, :album => valid_attributes}, valid_session
        expect(assigns(:album)).to eq(album)
      end

      it "redirects to the album" do
        album = Album.create! valid_attributes
        put :update, {:id => album.to_param, :album => valid_attributes}, valid_session
        expect(response).to redirect_to(album)
      end
    end

    describe "with invalid params" do
      it "assigns the album as @album" do
        album = Album.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Album).to receive(:update).and_return(false)
        put :update, {:id => album.to_param, :album => { "title" => "invalid value" }}, valid_session
        expect(assigns(:album)).to eq(album)
      end

      it "re-renders the 'edit' template" do
        album = Album.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Album).to receive(:update).and_return(false)
        put :update, {:id => album.to_param, :album => { "title" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested album" do
      album = Album.create! valid_attributes
      expect {
        delete :destroy, {:id => album.to_param}, valid_session
      }.to change(Album, :count).by(-1)
    end

    it "redirects to the albums list" do
      album = Album.create! valid_attributes
      delete :destroy, {:id => album.to_param}, valid_session
      expect(response).to redirect_to(albums_url)
    end
  end

end
