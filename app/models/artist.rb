class Artist < ActiveRecord::Base
  extend FriendlyId
  has_many :tracks
  has_many :albums

  friendly_id :name, use: [:slugged, :finders], sequence_separator: '_'

  # Ensure the artist's name exists and is unique
  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false }

  # Ensure the rating is an integer from 0 to 5
  validates :rating, numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 0,
                      less_than_or_equal_to: 5
                    }

  scope :rating, -> rating { where(rating: rating) }
end
