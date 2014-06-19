class Track < ActiveRecord::Base
  extend FriendlyId
  belongs_to :artist
  belongs_to :album
  has_and_belongs_to_many :genres

  friendly_id :title, use: [:slugged, :finders], sequence_separator: '_'

  # Ensure a track has a title, artist, album,
  # track_id, and location exist
  validates :title, :artist, :album, :track_id, :location, presence: true

  # Ensure the title is unique within the album
  validates :title, uniqueness: {
                      scope: :album,
                      case_sensitive: false
                    }

  # Ensure the artist and album are valid
  validates_associated :album, :artist

  # Ensure the track_id are integers and 1..
  validates :track_id, numericality: {
                        only_integer: true,
                        greater_than_or_equal_to: 1
                      }

  # Ensure the track_id is unique with the album
  validates :track_id, uniqueness: { scope: :album }

  # Ensure that if a disc_id exists, it is an
  # integer of 1..
  validates :disc_id, numericality: {
                        only_integer: true,
                        greater_than_or_equal_to: 1,
                        allow_nil: true
                      }

  # Ensure that only one track has this path.
  # Scope: global
  validates :location, uniqueness: true

  validates :rating, numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 0,
                      less_than_or_equal_to: 5
                    }
  scope :artist, -> artist { includes(:artist).where('artists.slug = ? ', artist).references(:artist) }
  scope :genre, -> genre { includes(:genres).where('genres.slug = ? ', genre).references(:genres) }
  scope :album, -> genre { includes(:album).where('albums.slug = ? ', albums).references(:album) }
  scope :rating, -> rating { where(rating: rating) }
  scope :format, -> format { where(format: format) }
  scope :year, -> year { where("date >= ? and date <= ?", "#{year}-01-01", "#{year}-12-31")}
end