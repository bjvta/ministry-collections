class CreateBalances < ActiveRecord::Migration[7.1]
  def change
    create_table :balances do |t|
      t.integer :type
      t.decimal :amount, precision: 10, scale: 2
      t.references :member, null: false, foreign_key: true
      t.integer :income_type, default: 0
      t.decimal :previous_balance, precision: 10, scale: 2
      t.decimal :current_balance, precision: 10, scale: 2

      t.timestamps
    end
  end
end
