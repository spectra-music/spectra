attributes :title, :rating,
           :date, :location,
           :bitrate, :lyrics,
           :track_id, :disc_id,
           :format
glue(:artist) { attribute name: :artist }
glue(:album) { attribute title: :album }