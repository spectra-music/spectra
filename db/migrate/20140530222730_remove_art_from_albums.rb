class RemoveArtFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :art
  end
end
