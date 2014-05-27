class AddNumDiscsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :num_discs, :integer
  end
end
