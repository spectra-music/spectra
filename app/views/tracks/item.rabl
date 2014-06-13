attributes :title, :rating,
           :date, :format,
           :bitrate, :lyrics,
           :track_id, :disc_id,
           :location, :friendly_id

child(:artist) { attributes :name, :friendly_id }
child(:album) { attributes :title, :friendly_id }