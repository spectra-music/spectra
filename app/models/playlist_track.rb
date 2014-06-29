class PlaylistTrack < ActiveRecord::Base
  belongs_to :track
  belongs_to :playable, polymorphic: true
  belongs_to :queue, class_name: 'Playlist'

  validates :track_num, uniqueness: { scope: :playable }

  validates :queue_id, numericality: { equal_to: 1 }, allow_nil: true
end
