module TracksHelper
  def track_path(track, options={})
    artist_album_track_path(track.album.artist, track.album, track, options)
  end

  def track_url(track, options={})
    artist_album_track_url(track.album.artist, track.album, track, options)
  end
end
