object @artist
extends 'artists/item'
child :albums do
  collection @artist.albums
  extends 'albums/item'
  node(:url) { |a| album_url a}
end