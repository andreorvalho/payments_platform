# This migration comes from customer_data (originally 20230312110116)
class AddCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name,  null: false
      t.string :place_of_birth,  null: false
      t.date :date_of_birth,  null: false

      t.timestamps
    end
  end
end
