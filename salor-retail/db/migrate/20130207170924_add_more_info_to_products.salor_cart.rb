# This migration comes from salor_cart (originally 20130131174046)
class AddMoreInfoToProducts < ActiveRecord::Migration
  def change
    add_column :salor_cart_products, :subscription_default_password, :string
    add_column :salor_cart_products, :digital_content_explanation, :text
  end
end
