# This migration comes from salor_cart (originally 20130206095515)
class AddSubscriptionServerIdToItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :subscription_server_id, :integer
  end
end
