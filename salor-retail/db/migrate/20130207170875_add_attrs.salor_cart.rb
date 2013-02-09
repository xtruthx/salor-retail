# This migration comes from salor_cart (originally 20121223205809)
class AddAttrs < ActiveRecord::Migration
  def change
    add_column :salor_cart_products, :digital_content, :boolean
    add_column :salor_cart_products, :subscription, :boolean
    add_column :salor_cart_products, :subscription_type, :string
    add_column :salor_cart_products, :subscription_period, :string
  end
end
