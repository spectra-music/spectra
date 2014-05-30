module ArtistsHelper
  def link_to_artist(artist)
    link_to artist.name, artist_path(artist)
  end
end
