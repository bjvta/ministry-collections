class UpdateTypeInBalance < ActiveRecord::Migration[7.1]
  def change
    rename_column :balances, :type, :type_movement
  end
end
