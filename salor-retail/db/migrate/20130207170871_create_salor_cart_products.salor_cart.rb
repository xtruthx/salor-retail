# This migration comes from salor_cart (originally 20121222113743)
class CreateSalorCartProducts < ActiveRecord::Migration
  def change
    create_table :salor_cart_products do |t|
      t.string :name
      t.text :digital_content_permissions
      t.money :unit_price
      t.integer :category_id
      t.string :description
      t.string :sku

      t.timestamps
    end
  end
end
