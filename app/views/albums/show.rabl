object @album
extends 'albums/item'
child(:artist) { attributes :name, :id, :friendly_id }
node(:cover) {|album| album.cover.url(:large)}
