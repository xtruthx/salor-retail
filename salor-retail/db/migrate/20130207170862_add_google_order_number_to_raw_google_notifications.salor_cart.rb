# This migration comes from salor_cart (originally 20121217154917)
class AddGoogleOrderNumberToRawGoogleNotifications < ActiveRecord::Migration
  def change
    add_column :salor_cart_raw_google_notifications, :google_order_number, :string
  end
end
