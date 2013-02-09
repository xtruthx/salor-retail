# This migration comes from salor_cart (originally 20130131073959)
class CreateSalorCartSubscriptionServers < ActiveRecord::Migration
  def change
    create_table :salor_cart_subscription_servers do |t|
      t.integer :product_id
      t.integer :accounts_max, :default => 10
      t.integer :accounts_left, :default => 10
      t.integer :accounts_used, :default => 0
      t.string :domain
      t.string :subdomain
      t.string :virtualhost_filter
      t.string :subscription_api_url
      t.boolean :hidden
      t.integer :hidden_by
      t.datetime :hidden_at
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
