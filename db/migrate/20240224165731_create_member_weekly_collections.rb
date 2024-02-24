class CreateMemberWeeklyCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :member_weekly_collections do |t|
      t.references :member, null: false, foreign_key: true
      t.references :weekly_collection, null: false, foreign_key: true
      t.integer :status, default: 0, null: false
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :paid_date

      t.timestamps
    end
  end
end
