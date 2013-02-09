# This migration comes from salor_cart (originally 20130128113649)
class AddCancelledToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :cancelled, :boolean
  end
end
