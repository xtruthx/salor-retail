# This migration comes from salor_cart (originally 20121222113545)
class CreateSalorCartCategories < ActiveRecord::Migration
  def change
    create_table :salor_cart_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
