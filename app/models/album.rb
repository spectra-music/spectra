class Album < ActiveRecord::Base
  has_many :tracks
  belongs_to :artist
end
