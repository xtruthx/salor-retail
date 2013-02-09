# This migration comes from salor_cart (originally 20121218121623)
class RenameAttributesForBuyer < ActiveRecord::Migration
  def change
    rename_column :salor_cart_buyers, :signup_confirmation_email_requested, :signup_confirmation_email_received
    add_column :salor_cart_buyers, :signup_password_email_sent, :boolean
  end
end
