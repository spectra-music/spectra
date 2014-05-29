class Artist < ActiveRecord::Base
  has_many :tracks
  has_many :albums

  # Ensure the artist's name exists
  validates_presence_of :name

  # Ensure the name is unique
  validates_uniqueness_of :name, case_sensitive: false

  # Ensure the rating is an integer from 0 to 5
  validates_numericality_of :rating, only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 5,
                                     allow_nil: true
end
