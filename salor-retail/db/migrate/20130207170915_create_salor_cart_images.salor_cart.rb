# This migration comes from salor_cart (originally 20130130113201)
class CreateSalorCartImages < ActiveRecord::Migration
  def change
    create_table :salor_cart_images do |t|
      t.string :name
      t.string :imageable_type
      t.integer :imageable_id
      t.string :image_type
      t.boolean :hidden
      t.integer :hidden_by
      t.datetime :hidden_at

      t.timestamps
    end
  end
end
