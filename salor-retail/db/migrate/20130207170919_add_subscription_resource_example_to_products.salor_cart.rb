# This migration comes from salor_cart (originally 20130131121458)
class AddSubscriptionResourceExampleToProducts < ActiveRecord::Migration
  def change
    add_column :salor_cart_products, :subscription_resource_example, :string
  end
end
