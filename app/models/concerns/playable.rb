module Playable
  extend ActiveSupport::Concern

  included do
    has_many :playlist_tracks, as: :playable
    has_many :tracks, through: :playlist_tracks

    validates :name, uniqueness: true
  end

end