# This migration comes from salor_cart (originally 20121217105940)
class CreateSalorCartCancelledSubscriptionNotifications < ActiveRecord::Migration
  def change
    create_table :salor_cart_cancelled_subscription_notifications do |t|
      t.string :serial_number
      t.datetime :timestamp
      t.string :reason
      t.string :item_ids, :default => "--- []\n", :limit => 10000
      t.string :google_order_number
      t.integer :salor_cart_raw_google_notification_id

      t.timestamps
    end
  end
end
