class Track < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album

  # Ensure a track has a title, artist, album and track_id
  validates :title, :artist, :album, :track_id, presence: true

  # Ensure the title is unique within the album
  validates :title, uniqueness: { scope: :album,
                                  case_sensitive: false,
                                  message: 'should only be one in an album'}

  # Ensure the artist and album are valid
  validates_associated :album, :artist

  # Ensure the track_id is unique with the album
  validates :track_id, uniqueness: { scope: :album }

  # Ensure the track_id is an integer and 1..
  validates :track_id, numericality: { only_integer: true,
                                       greater_than_or_equal_to: 1 }
end