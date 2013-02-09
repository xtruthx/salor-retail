# This migration comes from salor_cart (originally 20130127161313)
class AddContainsSubscriptionItemToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :contains_subscription_item, :boolean
  end
end
