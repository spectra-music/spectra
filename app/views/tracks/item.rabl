attributes :title, :rating,
           :date, :format,
           :bitrate, :lyrics,
           :track_id, :disc_id,

glue(:artist) { attribute name: :artist }
glue(:album) { attribute title: :album }