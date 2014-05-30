class Genre < ActiveRecord::Base
  extend FriendlyId
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :albums

  friendly_id :name, use: [:slugged, :finders], sequence_separator: '_'

  validates_presence_of :name

  validates_uniqueness_of :name, case_sensitive: false
end
