# This migration comes from salor_cart (originally 20121224114930)
class AddCompletedToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :completed, :boolean
  end
end
