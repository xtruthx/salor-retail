# This migration comes from salor_cart (originally 20121224140139)
class AddPaymentProviderRedirectedToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :payment_provider_redirected, :boolean
  end
end
