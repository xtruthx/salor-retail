# This migration comes from salor_cart (originally 20130128151708)
class AddGonToChargeAmountNotification < ActiveRecord::Migration
  def change
    add_column :salor_cart_charge_amount_notifications, :google_order_number, :string
  end
end
