collection @albums
extends 'albums/item'
node(:cover) {|album| album.cover.url(:thumb)}
child(:artist) { attributes :name, :friendly_id }