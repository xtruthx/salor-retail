# This migration comes from salor_cart (originally 20121218114721)
class AddIdHashToBuyer < ActiveRecord::Migration
  def change
    add_column :salor_cart_buyers, :id_hash, :string
    add_column :salor_cart_buyers, :password_encrypted, :string
    add_column :salor_cart_buyers, :confirmation_salt, :string
    rename_column :salor_cart_buyers, :salt, :password_salt
  end
end
