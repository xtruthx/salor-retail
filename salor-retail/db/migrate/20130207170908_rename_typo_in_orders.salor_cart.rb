# This migration comes from salor_cart (originally 20130128162147)
class RenameTypoInOrders < ActiveRecord::Migration
  def up
    rename_column :salor_cart_orders, :last_autorized_amount_cents, :last_authorized_amount_cents
    rename_column :salor_cart_orders, :last_autorized_amount_currency, :last_authorized_amount_currency
  end

  def down
  end
end
