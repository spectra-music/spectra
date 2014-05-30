class RemoveNumTracksFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :num_tracks, :integer
  end
end
