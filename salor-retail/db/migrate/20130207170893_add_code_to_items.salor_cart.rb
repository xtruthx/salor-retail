# This migration comes from salor_cart (originally 20130107140601)
class AddCodeToItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :subscription_api_url, :string
  end
end
