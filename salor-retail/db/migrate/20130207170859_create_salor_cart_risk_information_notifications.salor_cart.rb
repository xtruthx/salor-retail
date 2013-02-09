# This migration comes from salor_cart (originally 20121217103943)
class CreateSalorCartRiskInformationNotifications < ActiveRecord::Migration
  def change
    create_table :salor_cart_risk_information_notifications do |t|
      t.string :serial_number
      t.datetime :timestamp
      t.string :partial_card_number
      t.string :ip_address
      t.string :google_order_number
      t.boolean :eligible_for_protection
      t.string :cvn_response
      t.integer :buyer_account_age
      t.string :avs_response
      t.integer :salor_cart_raw_google_notification_id

      t.timestamps
    end
  end
end
