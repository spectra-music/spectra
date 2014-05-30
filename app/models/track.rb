class Track < ActiveRecord::Base
  extend FriendlyId
  belongs_to :artist
  belongs_to :album
  has_and_belongs_to_many :genres

  friendly_id :title, use: [:slugged, :finders], sequence_separator: '_'

  # Ensure a track has a title, artist, album,
  # track_id, and location exist
  validates_presence_of :title, :artist, :album,
                        :track_id, :location

  # Ensure the title is unique within the album
  validates_uniqueness_of :title,
                          scope: :album,
                          case_sensitive: false

  # Ensure the artist and album are valid
  validates_associated :album, :artist

  # Ensure the track_id are integers and 1..
  validates_numericality_of :track_id,
                            only_integer: true,
                            greater_than_or_equal_to: 1

  # Ensure the track_id is unique with the album
  validates_uniqueness_of :track_id, scope: :album

  # Ensure that if a disc_id exists, it is an
  # integer of 1..
  validates_numericality_of :disc_id,
                            only_integer: true,
                            greater_than_or_equal_to: 1,
                            allow_nil: true

  # Ensure that only one track has this path.
  # Scope: global
  validates_uniqueness_of :location

  validates_numericality_of :rating,
                            only_integer: true,
                            greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 5
end