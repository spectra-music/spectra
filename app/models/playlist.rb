class Playlist < ActiveRecord::Base
  include Playable
  extend FriendlyId

  friendly_id :name,  use: [:slugged, :finders]

  has_many :queue_tracks, class_name: 'PlaylistTrack', foreign_key: :queue_id

  # Adds an Track or any model that contains tracks to a playlist
  def add(item)
    case item
    when Track
      tracks << item
    else
      tracks.concat(item.tracks)
    end
  end

end
