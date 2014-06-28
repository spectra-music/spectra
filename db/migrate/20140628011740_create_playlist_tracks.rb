class CreatePlaylistTracks < ActiveRecord::Migration
  def change
    create_table :playlist_tracks do |t|
      t.integer :track_num
      t.references :track
      t.integer :playable_id
      t.string :playable_type

      t.timestamps
    end
  end
end
