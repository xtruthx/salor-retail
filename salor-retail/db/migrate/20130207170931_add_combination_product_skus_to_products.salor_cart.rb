# This migration comes from salor_cart (originally 20130207073529)
class AddCombinationProductSkusToProducts < ActiveRecord::Migration
  def change
    add_column :salor_cart_products, :combination_product_skus, :string
  end
end
