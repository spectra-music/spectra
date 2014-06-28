class AddSlugToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :slug, :string
    add_index :playlists, :slug, unique: true
    add_column :flexlists, :slug, :string
    add_index :flexlists, :slug, unique: true
  end
end
