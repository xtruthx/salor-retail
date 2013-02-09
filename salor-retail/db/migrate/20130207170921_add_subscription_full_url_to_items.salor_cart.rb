# This migration comes from salor_cart (originally 20130131164347)
class AddSubscriptionFullUrlToItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :subscription_current_url_by_api, :string
    add_column :salor_cart_items, :subscription_default_password, :string
  end
end
