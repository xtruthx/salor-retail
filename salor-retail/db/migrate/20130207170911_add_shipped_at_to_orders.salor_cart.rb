# This migration comes from salor_cart (originally 20130129095738)
class AddShippedAtToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :shipped_at, :datetime
  end
end
