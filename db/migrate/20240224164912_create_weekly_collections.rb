class CreateWeeklyCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :weekly_collections do |t|
      t.date :week_date
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
