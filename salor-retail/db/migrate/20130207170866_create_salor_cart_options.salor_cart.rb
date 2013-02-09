# This migration comes from salor_cart (originally 20121218102734)
class CreateSalorCartOptions < ActiveRecord::Migration
  def change
    create_table :salor_cart_options do |t|
      t.string :name
      t.string :description
      t.integer :product_id
      t.text :digital_content_permissions
      t.money :unit_price

      t.timestamps
    end
  end
end
