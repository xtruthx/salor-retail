# This migration comes from salor_cart (originally 20130128155847)
class AddMoreStuffToOrders2 < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :financial_state, :string
    add_column :salor_cart_orders, :fulfillment_state, :string
  end
end
