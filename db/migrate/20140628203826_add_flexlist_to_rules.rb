class AddFlexlistToRules < ActiveRecord::Migration
  def change
    add_reference :rules, :flexlist, index: true
  end
end
