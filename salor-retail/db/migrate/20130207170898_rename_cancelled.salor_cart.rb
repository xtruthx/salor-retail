# This migration comes from salor_cart (originally 20130128102511)
class RenameCancelled < ActiveRecord::Migration
  def change
    rename_column :salor_cart_items, :subscription_cancelled, :cancelled
  end
end
