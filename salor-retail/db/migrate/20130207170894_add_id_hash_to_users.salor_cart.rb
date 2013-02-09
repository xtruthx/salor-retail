# This migration comes from salor_cart (originally 20130126151038)
class AddIdHashToUsers < ActiveRecord::Migration
  def change
    add_column :salor_cart_users, :id_hash, :string
  end
end
