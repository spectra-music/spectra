class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :field
      t.integer :type
      t.string :value_start
      t.string :value_end

      t.timestamps
    end
  end
end
