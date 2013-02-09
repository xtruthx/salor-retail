# This migration comes from salor_cart (originally 20130129130213)
class CreateSalorCartTrackingInfos < ActiveRecord::Migration
  def change
    create_table :salor_cart_tracking_infos do |t|
      t.integer :order_id
      t.integer :item_id
      t.string :carrier_name
      t.integer :carrier_id
      t.string :tracking_number

      t.timestamps
    end
  end
end
