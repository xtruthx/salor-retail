class AddMustChangePriceToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :must_change_price, :boolean
  end
end
