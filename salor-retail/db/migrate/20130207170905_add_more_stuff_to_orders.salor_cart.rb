# This migration comes from salor_cart (originally 20130128155152)
class AddMoreStuffToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :charge_and_ship_sent, :boolean
  end
end
