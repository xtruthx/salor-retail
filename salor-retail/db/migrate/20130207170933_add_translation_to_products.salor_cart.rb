# This migration comes from salor_cart (originally 20130207104313)
class AddTranslationToProducts < ActiveRecord::Migration
  def change
	begin
    		add_column :salor_cart_product_translations, :description_long, :text
	rescue
		puts $!
	end
  end
end
