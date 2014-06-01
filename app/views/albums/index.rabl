collection @albums
extends 'albums/item'
glue(:artist) { attribute name: :artist }
node(:url) { |a| album_url a }