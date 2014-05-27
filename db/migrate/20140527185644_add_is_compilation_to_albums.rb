class AddIsCompilationToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :is_compilation, :boolean
  end
end
