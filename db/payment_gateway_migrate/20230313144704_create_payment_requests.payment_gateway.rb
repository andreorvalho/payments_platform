# This migration comes from payment_gateway (originally 20230311171311)
class CreatePaymentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_requests do |t|
      t.integer :customer_id, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.datetime :timestamp, null: false

      t.timestamps
    end
  end
end
