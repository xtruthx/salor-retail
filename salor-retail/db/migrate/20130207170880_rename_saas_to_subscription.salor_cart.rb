# This migration comes from salor_cart (originally 20121224131335)
class RenameSaasToSubscription < ActiveRecord::Migration
  def change
    rename_column :salor_cart_orders, :saas_subdomain, :subscription_subdomain
    add_column :salor_cart_orders, :subscription_subdomain_required, :boolean
    add_column :salor_cart_products, :subscription_subdomain_required, :boolean
  end
end
