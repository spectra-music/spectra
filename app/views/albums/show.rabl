object @album
extends 'albums/item'
child(:artist) { attributes :name }
node(:cover) {|album| album.cover.url(:large)}