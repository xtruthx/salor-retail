# This migration comes from salor_cart (originally 20130128152601)
class ChangeTimestamp < ActiveRecord::Migration
  def up
    change_column :salor_cart_charge_amount_notifications, :timestamp, :datetime
  end

  def down
    change_column :salor_cart_charge_amount_notifications, :timestamp, :string
  end
end
