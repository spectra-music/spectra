class ChangeCreateGenresToName < ActiveRecord::Migration
  def change
    rename_column :genres, 'CreateGenres', :name
  end
end
