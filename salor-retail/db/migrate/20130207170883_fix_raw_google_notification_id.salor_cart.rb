# This migration comes from salor_cart (originally 20121225200545)
class FixRawGoogleNotificationId < ActiveRecord::Migration
  def change
    rename_column :salor_cart_order_state_change_notifications, :salor_cart_raw_google_notification_id, :raw_google_notification_id
    rename_column :salor_cart_risk_information_notifications, :salor_cart_raw_google_notification_id, :raw_google_notification_id
    rename_column :salor_cart_authorization_amount_notifications, :salor_cart_raw_google_notification_id, :raw_google_notification_id
    rename_column :salor_cart_cancelled_subscription_notifications, :salor_cart_raw_google_notification_id, :raw_google_notification_id
    add_column :salor_cart_new_order_notifications, :raw_google_notification_id, :integer
  end
end
