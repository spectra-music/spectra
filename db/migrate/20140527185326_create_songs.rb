class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :rating
      t.integer :artist_id
      t.integer :album_id
      t.date :date
      t.string :location
      t.float :bitrate
      t.text :lyrics
      t.integer :track_id
      t.integer :disc_id
      t.string :format

      t.timestamps
    end
  end
end
