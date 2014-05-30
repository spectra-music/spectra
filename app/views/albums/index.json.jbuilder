json.array!(@albums) do |album|
  json.extract! album, :title, :rating, :artist, :art, :release_date
  json.url artist_album_url(album.artist, album, format: :json)
end
