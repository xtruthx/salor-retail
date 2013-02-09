# This migration comes from salor_cart (originally 20121218102354)
class CreateSalorCartItems < ActiveRecord::Migration
  def change
    create_table :salor_cart_items do |t|
      t.integer :order_id
      t.string :name
      t.integer :quantity
      t.money :unit_price
      t.string :description
      t.string :sku
      t.boolean :digital_content
      t.string :digital_content_key
      t.string :digital_content_url
      t.string :digital_content_description
      t.boolean :subscription
      t.string :subscription_period
      t.string :subscription_type
      t.datetime :subscription_start_date
      t.money :subscription_maximum_charge

      t.timestamps
    end
  end
end
