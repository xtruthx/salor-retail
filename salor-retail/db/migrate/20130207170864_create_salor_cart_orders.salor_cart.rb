# This migration comes from salor_cart (originally 20121218101758)
class CreateSalorCartOrders < ActiveRecord::Migration
  def change
    create_table :salor_cart_orders do |t|
      t.string :google_order_number
      t.string :merchant_order_number
      t.datetime :payment_last_date
      t.money :payment_last
      t.string :payment_interval
      t.string :saas_subdomain

      t.timestamps
    end
  end
end
