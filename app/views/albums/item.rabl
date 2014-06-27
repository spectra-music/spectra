attributes :friendly_id, :title, :rating, :release_date,
           :num_discs, :num_tracks, :is_compilation
child(:genres) { attributes :name, :friendly_id }