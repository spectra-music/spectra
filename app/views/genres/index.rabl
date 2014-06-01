collection @genres
attributes :name
node(:url) { |g| genre_url(g) }