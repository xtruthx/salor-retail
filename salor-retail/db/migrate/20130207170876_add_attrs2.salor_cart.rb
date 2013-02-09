# This migration comes from salor_cart (originally 20121223210600)
class AddAttrs2 < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :product_id, :integer
  end
end
