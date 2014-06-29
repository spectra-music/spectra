class AddQueueToPlaylistTracks < ActiveRecord::Migration
  def change
    add_column :playlist_tracks, :queue_id, :integer
  end
end
