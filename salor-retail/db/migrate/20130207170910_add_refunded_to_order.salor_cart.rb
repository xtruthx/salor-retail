# This migration comes from salor_cart (originally 20130129090902)
class AddRefundedToOrder < ActiveRecord::Migration
  def change
    add_column :salor_cart_orders, :refunded, :boolean
    add_column :salor_cart_orders, :last_refunded_at, :datetime
    add_column :salor_cart_orders, :cancelled_at, :datetime
    add_money :salor_cart_orders, :refund_amount
    add_column :salor_cart_items, :cancelled_at, :datetime
    add_column :salor_cart_items, :subscription_cancelled_at, :datetime
  end
end
