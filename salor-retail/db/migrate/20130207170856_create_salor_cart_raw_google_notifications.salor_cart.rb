# This migration comes from salor_cart (originally 20121217094144)
class CreateSalorCartRawGoogleNotifications < ActiveRecord::Migration
  def change
    create_table :salor_cart_raw_google_notifications do |t|
      t.string :type
      t.text :raw_xml, :limit => 200000

      t.timestamps
    end
  end
end
