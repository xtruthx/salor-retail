class AddCouponTypeToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :coupon_type, :string
  end
end
