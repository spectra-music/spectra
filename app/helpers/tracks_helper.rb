module TracksHelper
  def track_path(track)
    artist_album_track_path(track.artist, track.album, track)
  end
end
