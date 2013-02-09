# This migration comes from salor_cart (originally 20130128160725)
class AddMoreStuffToOrders3 < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :last_autorized_amount_cents, :integer
    add_column :salor_cart_orders, :last_autorized_amount_currency, :string
  end
end
