# This migration comes from salor_cart (originally 20121224094124)
class AddOrderIdToOptionItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_option_items, :order_id, :integer
  end
end
