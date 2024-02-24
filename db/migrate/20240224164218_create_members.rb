class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.boolean :active
      t.boolean :enabled_to_pay

      t.timestamps
    end
  end
end
