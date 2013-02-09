# This migration comes from salor_cart (originally 20121226113414)
class MovePaymentProviderToOrders < ActiveRecord::Migration
  def change
    remove_column :salor_cart_buyers, :signup_payment_provider
    add_column :salor_cart_orders, :payment_provider, :string
  end
end
