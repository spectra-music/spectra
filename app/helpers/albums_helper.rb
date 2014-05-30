module AlbumsHelper
  def link_to_album(album)
    link_to album.name, artist_album_path(album.artist, album)
  end

  def album_path(album, options={})
    artist_album_path album.artist, album, options
  end

  def album_url(album, options={})
    artist_album_url(album.artist, album, options)
  end
end
