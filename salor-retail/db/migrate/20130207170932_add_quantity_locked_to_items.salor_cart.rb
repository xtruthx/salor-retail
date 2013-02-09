# This migration comes from salor_cart (originally 20130207082140)
class AddQuantityLockedToItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :quantity_locked, :boolean
  end
end
