class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/chipzel
  # GET /artists/chipzel.json
  def show
  end

  # PATCH/PUT /artists/chipzel
  # PATCH/PUT /artists/chipzel.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.json { render :show, status: :ok, location: @artist }
      else
        format.json { render json: @artist.errors, status: :unprocessable_entity }
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
