object @genre
attributes :name
child :albums do
  collection @genre.albums
  extends 'albums/item'
  node(:url) { |a| album_url a}
end
