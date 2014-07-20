class AddMatchToFlexlist < ActiveRecord::Migration
  def change
    add_column :flexlists, :match, :integer
  end
end
