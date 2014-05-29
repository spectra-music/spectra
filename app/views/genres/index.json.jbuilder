json.array!(@genres) do |genre|
  json.extract! genre, :id
  json.url genre_url(genre, format: :json)
end
