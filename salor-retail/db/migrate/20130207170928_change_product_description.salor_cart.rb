# This migration comes from salor_cart (originally 20130204151333)
class ChangeProductDescription < ActiveRecord::Migration
  def change
    add_column :salor_cart_products, :description_long, :text
  end
end
