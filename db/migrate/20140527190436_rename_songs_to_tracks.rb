class RenameSongsToTracks < ActiveRecord::Migration
  def change
    rename_table :songs, :tracks
  end
end
