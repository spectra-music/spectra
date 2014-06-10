collection @genres
attributes :name, :friendly_id
node(:url) { |g| genre_url(g) }