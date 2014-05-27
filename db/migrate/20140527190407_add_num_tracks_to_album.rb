class AddNumTracksToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :num_tracks, :integer
  end
end
