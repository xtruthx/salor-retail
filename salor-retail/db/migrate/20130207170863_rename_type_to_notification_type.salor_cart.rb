# This migration comes from salor_cart (originally 20121217162040)
class RenameTypeToNotificationType < ActiveRecord::Migration
  def change
    rename_column :salor_cart_raw_google_notifications, :type, :klass
  end
end
