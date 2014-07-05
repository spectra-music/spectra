# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'yaml'

Playlist.create(name: 'Queue')

genres = YAML.load_file(Rails.root.join('db', 'genre.yml'))
genres.each do |g|
  Genre.create(g)
end

rand = Random.new
5.times do
  artist = Artist.create!( name: Faker::Name.name, rating: rand.rand(0..5))
  5.times do
    genre = Genre.all.sample(2)
    album = Album.new( title: Faker::Company.catch_phrase,
                          artist: artist,
                          rating: rand.rand(0..5),
                          num_discs: 1,
                          is_compilation: [true, false].sample,
                          release_date: rand.rand(Date.new(1900, 1, 1)..Date.today),
                          cover: "http://robohash.org/#{Faker::Lorem.words.join}.png"
                          )
    album.genres = genre
    album.save!
    15.times do |x|
      track = Track.new( title: Faker::Company.bs,
                    disc_id: 1,
                    track_id: x + 1,
                    rating: rand.rand(0..5),
                    album: album,
                    artist: artist,
                    location: Faker::Internet.url,
                    date: rand.rand(Date.new(1900, 1, 1)..Date.today)
       )
      track.genres = genre
      track.save!
    end
  end
end

5.times do
  playlist = Playlist.new(name: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}")
  playlist.tracks.concat(Track.all.sample(15))
  playlist.save
end