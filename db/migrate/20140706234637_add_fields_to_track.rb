class AddFieldsToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :bpm, :integer
    add_column :tracks, :length, :integer
    add_column :tracks, :composer, :string
    add_column :tracks, :play_count, :integer
    add_column :tracks, :file_size, :integer
  end
end
