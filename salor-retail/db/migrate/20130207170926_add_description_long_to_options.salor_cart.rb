# This migration comes from salor_cart (originally 20130203071527)
class AddDescriptionLongToOptions < ActiveRecord::Migration
  def change
    begin
      add_column :salor_cart_options, :description_long, :text
    rescue
     puts $!
    end
    begin
      add_column :salor_cart_option_translations, :description_long, :text
    rescue
      puts $!
    end
  end
end
