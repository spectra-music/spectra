class CreateFlexlists < ActiveRecord::Migration
  def change
    create_table :flexlists do |t|
      t.string :name

      t.timestamps
    end
  end
end
