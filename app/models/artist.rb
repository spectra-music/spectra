class Artist < ActiveRecord::Base
  has_many :tracks
  has_many :albums

  # Ensure the artist's name exists
  validates :name, presence: true

  # Ensure the name is unique
  validates :name, uniqueness: { case_sensitive: false }

  # Ensure the rating is an integer from 0 to 5
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 5 }
end
