module Playable
  extend ActiveSupport::Concern

  included do
    has_many :playlist_tracks, -> { order 'track_num' }, as: :playable
    has_many :tracks, through: :playlist_tracks

    validates :name, presence: true,
                     uniqueness: { case_sensitive: false }
  end

end