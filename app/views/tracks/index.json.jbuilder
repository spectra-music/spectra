json.array!(@tracks) do |song|
  json.extract! song, :id, :title, :rating, :artist_id, :album_id, :date, :location, :bitrate, :lyrics, :track_id, :disc_id, :format
  json.url song_url(song, format: :json)
end
