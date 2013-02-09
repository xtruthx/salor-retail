# This migration comes from salor_cart (originally 20121226103146)
class AddInOutgoingToRawGoogleNotificaitons < ActiveRecord::Migration
  def change
    add_column :salor_cart_raw_google_notifications, :incoming, :boolean
  end
end
