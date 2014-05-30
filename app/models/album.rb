class Album < ActiveRecord::Base
  # An album is composed of 1 or more tracks
  has_many :tracks

  # An album is part of an artist's collection
  belongs_to :artist

  has_and_belongs_to_many :genres

  # Ensure we have a title and artist
  validates_presence_of :title, :artist

  # Ensure our title is unique
  validates_uniqueness_of :title, case_sensitive: false

  # Ensure our artist is valid
  validates_associated :artist

  # Ensure is_compilation is either true or false
  validates_inclusion_of :is_compilation, in: [true, false]

  # Ensure rating is an integer from 0 to 5
  validates_numericality_of :rating, only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 5,
                                     allow_nil: true

  # Ensure num_discs is an integer greater than 0
  validates_numericality_of :num_discs,
                            only_integer: true,
                            greater_than: 0,
                            allow_nil: true

  def num_tracks
    tracks.count
  end

  def average_rating
    tracks.average(:rating)
  end
end
