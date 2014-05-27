json.array!(@tracks) do |track|
  json.extract! track, :id, :title, :rating, :artist_id, :album_id, :date, :location, :bitrate, :lyrics, :track_id, :disc_id, :format
  json.url track_url(track, format: :json)
end
