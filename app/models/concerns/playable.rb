module Playable
  extend ActiveSupport::Concern
  extend FriendlyId

  included do
    has_many :playlist_tracks, as: :playable
    has_many :tracks, through: :playlist_tracks

    validates :name, uniqueness: true

    friendly_id :name,  use: [:slugged, :finders]
  end

end