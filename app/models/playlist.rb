class Playlist < ActiveRecord::Base
  has_many :playlist_tracks, as: :playable

  has_many :tracks, through: :playlist_tracks
end
