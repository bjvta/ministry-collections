class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :member, null: false, foreign_key: true
      t.text :description
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
