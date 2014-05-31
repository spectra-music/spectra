object @album
extends 'albums/item'
glue(:artist) { attribute name: :artist }
child :tracks do
  collection @album.tracks
  extends 'tracks/item'
  node(:url) { |t| track_url t }
end