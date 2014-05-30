module AlbumsHelper
  def link_to_album(album)
    link_to album.name, artist_album_path(album.artist, album)
  end

  def album_path(album)
    artist_album_path album.artist, album
  end
end
