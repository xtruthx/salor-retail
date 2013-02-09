# This migration comes from salor_cart (originally 20121226121626)
class AddGoogleAnalyticsDataToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :google_analytics_data, :string
  end
end
