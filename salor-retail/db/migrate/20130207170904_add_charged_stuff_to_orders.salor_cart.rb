# This migration comes from salor_cart (originally 20130128154625)
class AddChargedStuffToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :charged, :boolean
    add_column :salor_cart_orders, :shipped, :boolean
    add_column :salor_cart_orders, :last_charged_at, :datetime
    add_column :salor_cart_orders, :last_charged_amount_cents, :integer
    add_column :salor_cart_orders, :last_charged_amount_currency, :string
  end
end
