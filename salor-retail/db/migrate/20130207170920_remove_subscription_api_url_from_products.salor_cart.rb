# This migration comes from salor_cart (originally 20130131154710)
class RemoveSubscriptionApiUrlFromProducts < ActiveRecord::Migration
  def change
    remove_column :salor_cart_products, :subscription_api_url
  end
end
