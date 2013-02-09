# This migration comes from salor_cart (originally 20121222114110)
class CreateSalorCartOptionItems < ActiveRecord::Migration
  def change
    create_table :salor_cart_option_items do |t|
      t.integer :option_id
      t.money :unit_price
      t.string :name
      t.string :description
      t.text :digital_content_permissions
      t.integer :product_id
      t.integer :item_id

      t.timestamps
    end
  end
end
