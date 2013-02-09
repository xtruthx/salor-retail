# This migration comes from salor_cart (originally 20121226122425)
class AddSubscriptionStartDateToItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :subscription_times, :integer

    add_column :salor_cart_products, :subscription_start_date, :datetime
    add_column :salor_cart_products, :subscription_times, :integer
  end
end
