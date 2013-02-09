# This migration comes from salor_cart (originally 20130131173736)
class RenameColumnIdentifier < ActiveRecord::Migration
  def change
    rename_column :salor_cart_items, :subscription_subdomain_required, :subscription_identifier_required
    rename_column :salor_cart_products, :subscription_subdomain_required, :subscription_identifier_required
  end
end
