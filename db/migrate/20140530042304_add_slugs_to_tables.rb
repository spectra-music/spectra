class AddSlugsToTables < ActiveRecord::Migration
  def change
    add_column :artists, :slug, :string
    add_index :artists, :slug, unique: true
    add_column :albums, :slug, :string
    add_index :albums, :slug, unique: true
    add_column :tracks, :slug, :string
    add_index :tracks, :slug, unique: true
    add_column :genres, :slug, :string
    add_index :genres, :slug, unique: true
  end
end
