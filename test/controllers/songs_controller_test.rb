require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  setup do
    @track = songs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post :create, track: { album_id: @track.album_id, artist_id: @track.artist_id, bitrate: @track.bitrate, date: @track.date, disc_id: @track.disc_id, format: @track.format, location: @track.location, lyrics: @track.lyrics, rating: @track.rating, title: @track.title, track_id: @track.track_id }
    end

    assert_redirected_to song_path(assigns(:track))
  end

  test "should show song" do
    get :show, id: @track
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @track
    assert_response :success
  end

  test "should update song" do
    patch :update, id: @track, track: { album_id: @track.album_id, artist_id: @track.artist_id, bitrate: @track.bitrate, date: @track.date, disc_id: @track.disc_id, format: @track.format, location: @track.location, lyrics: @track.lyrics, rating: @track.rating, title: @track.title, track_id: @track.track_id }
    assert_redirected_to song_path(assigns(:track))
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete :destroy, id: @track
    end

    assert_redirected_to songs_path
  end
end
