object @album
extends 'albums/item'
glue(:artist) { attribute name: :artist }
node(:cover) {|album| album.cover.url(:large)}
