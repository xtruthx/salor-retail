# This migration comes from salor_cart (originally 20121223161602)
class RenameConfirmationEmailToActivationEmail2 < ActiveRecord::Migration
  def change
    rename_column :salor_cart_buyers, :confirmation_salt, :activation_salt
  end
end
