# This migration comes from salor_cart (originally 20121226120858)
class AddPaymentProviderRedirectUrlToOrders < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :payment_provider_redirect_url, :string
  end
end
