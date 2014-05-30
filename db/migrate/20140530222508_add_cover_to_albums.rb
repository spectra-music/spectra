class AddCoverToAlbums < ActiveRecord::Migration
  def self.up
    add_attachment :albums, :cover
  end

  def self.down
    remove_attachment :albums, :cover
  end
end
