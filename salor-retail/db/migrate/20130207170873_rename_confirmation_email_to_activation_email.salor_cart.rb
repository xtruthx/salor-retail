# This migration comes from salor_cart (originally 20121223155115)
class RenameConfirmationEmailToActivationEmail < ActiveRecord::Migration
  def change
    rename_column :salor_cart_buyers, :signup_confirmation_email_sent, :signup_activation_email_sent
    remove_column :salor_cart_buyers, :signup_confirmation_email_received
    add_column :salor_cart_buyers, :signup_activated, :boolean
  end
end
