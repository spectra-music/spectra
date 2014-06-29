class PlaylistTrack < ActiveRecord::Base
  belongs_to :track
  belongs_to :playable, polymorphic: true
  belongs_to :queue, class_name: 'Playlist'

  validates :track_num, uniqueness: { scope: :playable }
end
