# This migration comes from salor_cart (originally 20121224111737)
class RenameColumnsInOrders < ActiveRecord::Migration
  def change
    rename_column :salor_cart_orders, :active, :subscription_active
    add_money :salor_cart_orders, :total
    add_money :salor_cart_items, :total
    add_money :salor_cart_option_items, :total
  end
end
