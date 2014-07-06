class Album < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  extend FriendlyId

  # An album is composed of 1 or more tracks
  has_many :tracks

  # An album is part of an artist's collection
  belongs_to :artist

  # An album can be of many genres
  has_and_belongs_to_many :genres

  has_attached_file :cover, styles: { large: '600x600>',
                                      medium: '300x300>',
                                      small: '175x175>',
                                      thumb: '100x100>'}


  friendly_id :slug_candidates, use: [:slugged, :finders]

  # Name is another way of getting title
  alias_attribute :name, :title

  # Album cover -> art
  alias_attribute :art, :cover

  # Ensure we have a title and artist
  validates :title, :artist, presence: true

  # Ensure each album title is unique to an artist
  validates :title, uniqueness: { case_sensitive: false, scope: :artist }

  # Ensure our artist is valid
  validates_associated :artist

  # Ensure is_compilation is either true or false
  validates :is_compilation, inclusion: { in: [true, false] }

  # Ensure rating is an integer from 0 to 5
  validates :rating, numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 0,
                      less_than_or_equal_to: 5
                    }

  # Ensure num_discs is an integer greater than 0
  validates :num_discs, numericality: {
                          only_integer: true,
                          greater_than: 0,
                          allow_nil: true
                        }

  # Make sure our cover is an image
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  scope :artist, -> artist { includes(:artist).where('artists.slug = ? ', artist).references(:artist) }
  scope :genre, -> genre { includes(:genres).where('genres.slug = ? ', genre).references(:genres) }
  scope :rating, -> rating { where(rating: rating) }
  scope :is_compilation, -> { where(is_compilation: true) }
  scope :year, -> year { where("release_date >= ? and release_date <= ?", "#{year}-01-01", "#{year}-12-31")}

  def slug_candidates
    [
      :title,
      [:title, :artist],
      [:title, :artist, :release_year]
    ]
  end

  def num_tracks
    tracks.count
  end

  def average_rating
    tracks.average(:rating)
  end

  def release_year
    release_date.try(:year)
  end
end
