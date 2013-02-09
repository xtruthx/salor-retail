# This migration comes from salor_cart (originally 20121217105216)
class CreateSalorCartAuthorizationAmountNotifications < ActiveRecord::Migration
  def change
    create_table :salor_cart_authorization_amount_notifications do |t|
      t.string :serial_number
      t.string :google_order_number
      t.money :authorization_amount
      t.datetime :authorization_expiration_date
      t.string :avs_response
      t.string :cvn_response
      t.datetime :timestamp
      t.integer :salor_cart_raw_google_notification_id

      t.timestamps
    end
  end
end
