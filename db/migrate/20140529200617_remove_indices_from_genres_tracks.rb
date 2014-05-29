class RemoveIndicesFromGenresTracks < ActiveRecord::Migration
  def change
    remove_index :genres_tracks, [:genre_id, :track_id]
    remove_index :genres_tracks, [:track_id, :genre_id]
  end
end
