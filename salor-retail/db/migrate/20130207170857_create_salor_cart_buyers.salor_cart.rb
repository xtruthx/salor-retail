# This migration comes from salor_cart (originally 20121217100224)
class CreateSalorCartBuyers < ActiveRecord::Migration
  def change
    create_table :salor_cart_buyers do |t|
      t.string :sku
      t.boolean :marketing_preferences_email_allowed
      t.string :billing_phone
      t.string :billing_fax
      t.string :billing_last_name
      t.string :billing_first_name
      t.string :billing_email
      t.string :billing_contact_name
      t.string :billing_company_name
      t.string :billing_address1
      t.string :billing_address2
      t.string :billing_postal_code
      t.string :billing_country_code
      t.string :billing_city
      t.string :billing_region
      t.string :shipping_phone
      t.string :shipping_fax
      t.string :shipping_first_name
      t.string :shipping_last_name
      t.string :shipping_email
      t.string :shipping_contact_name
      t.string :shipping_company_name
      t.string :shipping_address1
      t.string :shipping_address2
      t.string :shipping_postal_code
      t.string :shipping_country_code
      t.string :shipping_city
      t.string :shipping_region
      t.string :signup_email
      t.string :signup_ip
      t.boolean :signup_confirmation_email_sent
      t.boolean :signup_confirmation_email_requested
      t.boolean :signup_completed
      t.string :signup_payment_provider
      t.string :salt
      
      t.timestamps
    end
  end
end