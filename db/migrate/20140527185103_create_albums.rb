class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :rating
      t.integer :artist_id
      t.binary :art
      t.date :release_date

      t.timestamps
    end
  end
end
