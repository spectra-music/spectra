class PlaylistTrack < ActiveRecord::Base
  belongs_to :track
  belongs_to :playable, polymorphic: true
  belongs_to :queue, class_name: 'Playlist'

  acts_as_list scope: [:playable_id, :playable_type]

  validates :queue_id, numericality: { equal_to: 1 }, allow_nil: true

end
