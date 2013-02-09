# This migration comes from salor_cart (originally 20130126155748)
class AddProductUnitPriceToItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :product_unit_price_cents, :integer
    add_column :salor_cart_items, :product_unit_price_currency, :integer
  end
end
