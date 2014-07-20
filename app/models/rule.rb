class Rule < ActiveRecord::Base

  belongs_to :flexlist

  enum field: [ :title, :rating, :artist, :album, :date, :location, :bitrate,
                :disc_number, :track_number, :format, :bpm, :length, :composer,
                :play_count, :file_size, :date_added ]
  enum type: [ :is, :is_not, :is_greater_than, :is_less_than, :is_in_the_range,
               :begins_with, :ends_with, :contains, :does_not_contain, :is_before,
               :is_after ]
end
