collection @albums
extends 'albums/item'
attributes :release_year
node(:url) { |a| album_url a }
node(:cover) {|album| album.cover.url(:thumb)}
child(:artist) { attributes :name, :friendly_id }