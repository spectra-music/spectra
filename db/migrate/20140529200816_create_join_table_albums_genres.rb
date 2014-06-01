class CreateJoinTableAlbumsGenres < ActiveRecord::Migration
  def change
    create_join_table :albums, :genres do |_t|
      # t.index [:album_id, :genre_id]
      # t.index [:genre_id, :album_id]
    end
  end
end
