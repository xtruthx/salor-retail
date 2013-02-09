# This migration comes from salor_cart (originally 20121226102311)
class AddOrderIdToNotifications < ActiveRecord::Migration
  def change
    add_column :salor_cart_raw_google_notifications, :order_id, :integer
    add_column :salor_cart_order_state_change_notifications, :order_id, :integer
    add_column :salor_cart_authorization_amount_notifications, :order_id, :integer
    add_column :salor_cart_risk_information_notifications, :order_id, :integer
    add_column :salor_cart_cancelled_subscription_notifications, :order_id, :integer
  end
end
