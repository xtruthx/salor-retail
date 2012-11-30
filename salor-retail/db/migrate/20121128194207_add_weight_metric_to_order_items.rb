class AddWeightMetricToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :weight_metric, :string
  end
end
