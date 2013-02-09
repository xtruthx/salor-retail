# This migration comes from salor_cart (originally 20121217103148)
class CreateSalorCartOrderStateChangeNotifications < ActiveRecord::Migration
  def change
    create_table :salor_cart_order_state_change_notifications do |t|
      t.datetime :timestamp
      t.string :serial_number
      t.string :google_order_number
      t.string :new_financial_order_state
      t.string :previous_financial_order_state
      t.string :new_fulfillment_order_state
      t.string :previous_fulfillment_order_state
      t.string :reason
      t.integer :salor_cart_raw_google_notification_id

      t.timestamps
    end
  end
end
