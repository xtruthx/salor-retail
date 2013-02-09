# This migration comes from salor_cart (originally 20130129101947)
class CreateSalorCartRefundAmountNotifications < ActiveRecord::Migration
  def change
    create_table :salor_cart_refund_amount_notifications do |t|
      t.string :google_order_number
      t.integer :order_id
      t.integer :raw_google_notification_id
      t.money :latest_refund_amount
      t.money :total_refund_amount
      t.money :latest_fee_refund_amount
      t.datetime :timestamp

      t.timestamps
    end
  end
end
