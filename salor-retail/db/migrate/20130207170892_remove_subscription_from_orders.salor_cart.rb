# This migration comes from salor_cart (originally 20121227113106)
class RemoveSubscriptionFromOrders < ActiveRecord::Migration
  def change
    remove_column :salor_cart_orders, :subscription
    remove_column :salor_cart_orders, :subscription_active
  end
end
