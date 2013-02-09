# This migration comes from salor_cart (originally 20130131115129)
class AddDomainToItem < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :subscription_domain, :string
    add_column :salor_cart_items, :subscription_virtualhost_filter, :string
    add_column :salor_cart_items, :subscription_identifier, :string
  end
end
