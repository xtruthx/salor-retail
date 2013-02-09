# This migration comes from salor_cart (originally 20121218122644)
class AddSubscriptionAndActiveToSalorCartOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :subscription, :boolean
    add_column :salor_cart_orders, :active, :boolean
    add_column :salor_cart_orders, :buyer_id, :integer
  end
end
