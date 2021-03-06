class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update]
  has_scope :rating

  # GET /artists
  # GET /artists.json
  def index
    @artists = apply_scopes(Artist).all
  end

  # GET /artists/chipzel
  # GET /artists/chipzel.json
  def show
  end

  # PATCH/PUT /artists/chipzel
  # PATCH/PUT /artists/chipzel.json
  def update
    @artist.slug = nil
    respond_to do |format|
      if @artist.update(artist_params)
        format.json { render json: {artist: @artist.friendly_id, notice: 'Artist was successfully updated.'}, status: :ok, location: @artist }
      else
        format.json { render json: { errors: @artist.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :rating)
    end
end
