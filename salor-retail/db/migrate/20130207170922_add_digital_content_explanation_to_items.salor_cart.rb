# This migration comes from salor_cart (originally 20130131164659)
class AddDigitalContentExplanationToItems < ActiveRecord::Migration
  def change
    add_column :salor_cart_items, :digital_content_explanation, :text
  end
end
