# This migration comes from salor_cart (originally 20121216123135)
class CreateSalorCartNewOrderNotifications < ActiveRecord::Migration
  def change
    create_table :salor_cart_new_order_notifications do |t|
      t.string :serial_number
      t.datetime :timestamp
      #t.datetime :purchase_date
      #t.float :total_charge_amount
      t.string :google_order_number
      t.money :order_total
      t.string :fulfillment_order_state
      t.string :financial_order_state
      t.string :buyer_id
      t.money :order_adjustment_total_tax
      t.boolean :order_adjustment_merchant_calculation_successful
      t.money :order_adjustment_adjustment_total
      t.string :merchant_order_number
      t.integer :order_id

      t.timestamps
    end
  end
end
