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
      render json: { playlist: @playlist.slug, notice: 'Playlist was successfully created.' }, status: :created, location: @playlist
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1
  def update
    @playlist.tracks = []

    params[:tracks].each_with_index do |track, i|
      pt = PlaylisTrack.new(track_num: i+1)
      pt.track = Track.find(track)
      pt.playlist = @playlist
    end unless params[:tracks].nil?

    if @playlist.update(playlist_params)
      render json: {playlist: @playlist.slug, notice: 'Playist was successfully updated.'}, status: :ok, location: @playlist
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1
  def destroy
    @playlist.destroy
    head :no_content
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
