class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/1
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  def create
    @playlist = Playlist.new(playlist_params)

    if @playlist.save
      redirect_to @playlist, notice: 'Playlist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /playlists/1
  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist, notice: 'Playlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /playlists/1
  def destroy
    @playlist.destroy
    redirect_to playlists_url, notice: 'Playlist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def playlist_params
      params.require(:playlist).permit(:name)
    end
end
