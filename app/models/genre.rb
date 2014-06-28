class Genre < ActiveRecord::Base
  extend FriendlyId
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :albums

  friendly_id :name, use: [:slugged, :finders]

  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false }
end
