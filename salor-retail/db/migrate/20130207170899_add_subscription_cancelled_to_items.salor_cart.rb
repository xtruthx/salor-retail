# This migration comes from salor_cart (originally 20130128113419)
class AddSubscriptionCancelledToItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :subscription_cancelled, :boolean
  end
end
