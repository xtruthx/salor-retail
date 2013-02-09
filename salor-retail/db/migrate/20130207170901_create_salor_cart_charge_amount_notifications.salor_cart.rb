# This migration comes from salor_cart (originally 20130128144801)
class CreateSalorCartChargeAmountNotifications < ActiveRecord::Migration
  def change
    create_table :salor_cart_charge_amount_notifications do |t|
      t.integer :latest_charge_amount_cents
      t.string :latest_charge_amount_currency
      t.integer :total_charge_amount_cents
      t.string :total_charge_amount_currency
      t.integer :latest_charge_fee_total_cents
      t.string :latest_charge_fee_total_currency
      t.integer :latest_charge_fee_flat_cents
      t.string :latest_charge_fee_flat_currency
      t.string :latest_charge_fee_percentage
      t.string :timestamp
      t.integer :order_id
      t.integer :raw_google_notification_id
      t.timestamps
    end
  end
end
