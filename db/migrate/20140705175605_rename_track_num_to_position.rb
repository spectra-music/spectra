class RenameTrackNumToPosition < ActiveRecord::Migration
  def change
    rename_column :playlist_tracks, :track_num, :position
  end
end
