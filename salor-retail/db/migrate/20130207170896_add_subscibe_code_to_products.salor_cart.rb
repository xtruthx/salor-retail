# This migration comes from salor_cart (originally 20130127105313)
class AddSubscibeCodeToProducts < ActiveRecord::Migration
  def change
    add_column :salor_cart_products, :subscription_api_url, :string
    add_column :salor_cart_products, :subscription_api_params_subscribe, :text
    add_column :salor_cart_products, :subscription_api_params_unsubscribe, :text
    add_column :salor_cart_options, :subscription_api_params_subscribe, :text
    add_column :salor_cart_options, :subscription_api_params_unsubscribe, :text
  end
end
