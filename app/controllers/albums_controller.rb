class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  has_scope :artist
  has_scope :genre
  has_scope :rating
  has_scope :is_compilation, type: :boolean
  has_scope :year

  # GET /albums
  # GET /albums.json
  def index
    @albums = apply_scopes(Album).all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/1/edit
  def edit
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @album.artist = Artist.find_or_initialize_by(name: params[:artist]) do
      rating = 0
    end
    unless params[:genres].nil?
      @album.genres = []
      params[:genres].each { |genre| @album.genres << Genre.find_or_initialize_by(name: genre) }
    end
    @album.slug = nil
    if @album.update(album_params)
      render json: {album: @album.slug, artist: @album.artist.slug, notice: 'Album was successfully updated.'} , status: :ok, location: @album
    else
      render json: { errors: @album.errors.full_messages }, status: :unprocessable_entity
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :rating, :artist, :release_date, :is_compilation)
    end
end
