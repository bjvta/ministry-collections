class CreateFeeTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :fee_types do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2 

      t.timestamps
    end
  end
end
