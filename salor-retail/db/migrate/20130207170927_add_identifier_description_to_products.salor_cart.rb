# This migration comes from salor_cart (originally 20130203075151)
class AddIdentifierDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :salor_cart_products, :subscription_identifier_description, :text
  end
end
