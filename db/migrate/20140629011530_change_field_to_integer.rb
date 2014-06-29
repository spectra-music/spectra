class ChangeFieldToInteger < ActiveRecord::Migration
  def up
    change_column :rules, :field, :integer
  end

  def down
    change_column :rules, :field, :string
  end
end
