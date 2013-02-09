# This migration comes from salor_cart (originally 20130206102107)
class RemoveSubscriptionApiUrlFromItems < ActiveRecord::Migration
  def up
    remove_column :salor_cart_items, :subscription_api_url
  end

  def down
    add_column :salor_cart_items, :subscription_api_url, :string
  end
end
