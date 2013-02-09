# This migration comes from salor_cart (originally 20121227093647)
class MoveAttrsFromOrderToItem < ActiveRecord::Migration
  def change
    remove_column :salor_cart_orders, :payment_last_date
    remove_column :salor_cart_orders, :payment_last_cents
    remove_column :salor_cart_orders, :payment_last_currency
    remove_column :salor_cart_orders, :payment_interval
    remove_column :salor_cart_orders, :subscription_subdomain
    remove_column :salor_cart_orders, :subscription_subdomain_required

    add_column :salor_cart_items, :payment_last_date, :datetime
    add_column :salor_cart_items, :subscription_recurrence_request_last_date, :datetime
    add_column :salor_cart_items, :subscription_recurrence_request_last_cents, :integer
    add_column :salor_cart_items, :subscription_recurrence_request_last_currency, :string
    add_column :salor_cart_items, :subscription_subdomain, :string
    add_column :salor_cart_items, :subscription_subdomain_required, :boolean
    add_column :salor_cart_items, :subscription_host, :string
    add_column :salor_cart_items, :subscription_active, :boolean
    add_column :salor_cart_items, :subscription_cancelled, :boolean
  end
end
