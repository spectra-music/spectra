class Album < ActiveRecord::Base
  # An album is composed of 1 or more tracks
  has_many :tracks

  # An album is part of an artist's collection
  belongs_to :artist

  # Ensure we have a title, artist, and compilation flag
  validates :title, :artist, :is_compilation, presence: true

  # Ensure our title is unique
  validates :title, uniqueness: { case_sensitive: false }

  # Ensure our artist is valid
  validates_associated :artist

  # Ensure is_compilation is either true or false
  validates :is_compilation, inclusion: {in: [true, false]}

  # Ensure rating is an integer from 0 to 5
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 5 }

  # Ensure num_discs and num_tracks are integers greater than 0
  validates :num_discs, :num_tracks,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0 }

end
