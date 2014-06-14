class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  # GET /tracks
  # GET /tracks.json
  def all
    @tracks = Track.all
  end

  def index
    unless (params[:artist_id].nil? or params[:album_id].nil?)
      p = params.permit(:artist_id, :album_id)
      @tracks = Artist.find(p[:artist_id]).albums.find(p[:album_id]).tracks
    else
      @tracks = Track.all
    end
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
    @track = Track.new do |track|
      track.title = track_params[:title]
      track.artist = Artist.find_or_create_by(name: params[:track][:artist])
      track.album = Album.find_or_create_by(title: params[:track][:album]) do |album|
        album.artist = track.artist
        album.num_discs = 1
        album.release_date = track_params[:date]
        album.is_compilation = false
      end
      track.date = track_params[:date]
      track.location = track_params[:location]
      track.rating = track_params[:rating]
      track.bitrate = track_params[:bitrate]
      track.lyrics = track_params[:lyrics]
      track.track_id = track_params[:track_id]
      track.disc_id = track_params[:disc_id]
      track.format = track_params[:format]
    end

    respond_to do |format|
      if @track.save
        format.html { redirect_to artist_album_track_url(@track.album.artist, @track.album, @track), notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    unless params[:artist].nil?
      @track.artist = Artist.find_or_initialize_by(name: params[:artist])
      @track.artist.rating = 0 if @track.artist.rating.nil?
    end
    unless params[:album].nil?
      @track.album = Album.find_or_initialize_by(name: params[:album])
      @track.album.rating = 0 if @track.album.rating.nil?
    end
    unless params[:genres].nil?
      @track.genres = []
      params[:genres].each { |genre| @track.genres << Genre.find_or_create_by(name: genre) }
    end
    @track.slug = nil
    respond_to do |format|
      if @track.update(track_params)
        format.json { render json: {track: @track.slug, album: @track.album.slug, artist: @track.artist.slug, notice: 'Track was successfully updated.'}, status: :ok, location: artist_album_track_url(@track.artist, @track.album, @track) }
      else
        format.json { render json: { errors: @track.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
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
