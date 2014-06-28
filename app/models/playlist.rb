class Playlist < ActiveRecord::Base
  include Playable
  extend FriendlyId

  friendly_id :name,  use: [:slugged, :finders]

end
