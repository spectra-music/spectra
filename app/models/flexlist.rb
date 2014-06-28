class Flexlist < ActiveRecord::Base
  include Playable

  has_many :rules
end
