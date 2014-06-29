class Playlist < ActiveRecord::Base
  include Playable
  extend FriendlyId

  friendly_id :name,  use: [:slugged, :finders]

  has_many :collection_tracks, class_name: 'PlaylistTrack', foreign_key: :queue_id

  validate :must_be_queue_to_have_collection_tracks

  # Adds an Track or any model that contains tracks to a playlist
  def add(item)
    case item
    when Track
      tracks << item
    else
      tracks.concat(item.tracks)
    end
  end

  def must_be_queue_to_have_collection_tracks
    errors.add(:playlist, 'must be the queue to have queue tracks' ) if id != 1 and not collection_tracks.empty?
  end

end
