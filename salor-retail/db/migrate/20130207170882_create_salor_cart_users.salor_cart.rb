# This migration comes from salor_cart (originally 20121225095200)
class CreateSalorCartUsers < ActiveRecord::Migration
  def change
    create_table :salor_cart_users do |t|
      t.string :technician_email
      t.string :password
      t.string :password_encrypted
      t.string :password_salt
      t.integer :role, :default => 10

      t.timestamps
    end
  end
end
