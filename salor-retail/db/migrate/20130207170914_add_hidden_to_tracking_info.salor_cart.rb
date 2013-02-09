# This migration comes from salor_cart (originally 20130130081427)
class AddHiddenToTrackingInfo < ActiveRecord::Migration
  def change
    add_column :salor_cart_tracking_infos, :hidden, :boolean
    add_column :salor_cart_tracking_infos, :hidden_by, :integer
    add_column :salor_cart_tracking_infos, :hidden_at, :datetime
  end
end
