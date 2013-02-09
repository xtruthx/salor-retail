# This migration comes from salor_cart (originally 20130128165351)
class ChangeDefaultValuesForOrder < ActiveRecord::Migration
  def up
    change_column :salor_cart_orders, :last_charged_amount_cents, :integer, :default => 0
    change_column :salor_cart_orders, :last_authorized_amount_cents, :integer, :default => 0
  end

  def down
  end
end
