# This migration comes from salor_cart (originally 20130130141857)
class AddHiddenToOptions < ActiveRecord::Migration
  def change
    add_column :salor_cart_options, :hidden, :boolean
    add_column :salor_cart_options, :hidden_by, :integer
    add_column :salor_cart_options, :hidden_at, :datetime
    add_column :salor_cart_products, :hidden, :boolean
    add_column :salor_cart_products, :hidden_by, :integer
    add_column :salor_cart_products, :hidden_at, :datetime
  end
end
