class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  has_scope :artist
  has_scope :genre
  has_scope :album
  has_scope :rating
  has_scope :format
  has_scope :year

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = apply_scopes(Track).all
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)
    @track.artist = Artist.find_or_initialize_by(name: params[:artist]) do |artist|
      artist.rating = 0
    end
    @track.album = Album.find_or_initialize_by(name: params[:album]) do |album|
      album.artist = @track.artist
      album.num_discs = 1
      album.release_date = @track.date
      album.is_compilation = false
      album.rating = 0
    end

    if @track.save
      render json: {track: @track.slug, album: @track.album.slug, artist: @track.artist.slug, notice: 'Track was successfully created.'}, status: :created, location: @track
    else
      render json: { errors: @track.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    unless params[:artist].nil?
      @track.artist = Artist.find_or_initialize_by(name: params[:artist]) do |artist|
        artist.rating = 0
      end
    end
    unless params[:album].nil?
      @track.album = Album.find_or_initialize_by(name: params[:album]) do |album|
        album.rating = 0
      end
    end
    unless params[:genres].nil?
      @track.genres = []
      params[:genres].each { |genre| @track.genres << Genre.find_or_create_by(name: genre) }
    end
    @track.slug = nil
    if @track.update(track_params)
      render json: {track: @track.slug, album: @track.album.slug, artist: @track.artist.slug, notice: 'Track was successfully updated.'}, status: :ok, location: @track
    else
      render json: { errors: @track.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    head :no_content
  end

  def data
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:title, :rating, :date, :location, :bitrate, :lyrics, :track_id, :disc_id, :format)
    end
end
