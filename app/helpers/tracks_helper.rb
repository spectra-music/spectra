module TracksHelper
  def track_path(track, options={})
    artist_album_track_path(track.artist, track.album, track, options)
  end
end
