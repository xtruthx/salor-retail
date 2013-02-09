# This migration comes from salor_cart (originally 20130201163929)
class TranslateProducts < ActiveRecord::Migration
  def self.up
    SalorCart::Product.create_translation_table!({
      :name => {:type => :string},
      :description => {:type => :string},
      :digital_content_explanation => {:type => :text}
    }, {
      :migrate_data => true
    })
    SalorCart::Category.create_translation_table!({
      :name => {:type => :string}
    }, {
      :migrate_data => true
    })
    SalorCart::Option.create_translation_table!({
      :name => {:type => :string},
      :description => {:type => :string}
    }, {
      :migrate_data => true
    })
  end

  def self.down
    SalorCart::Product.drop_translation_table! :migrate_data => true
    SalorCart::Category.drop_translation_table! :migrate_data => true
    SalorCart::Option.drop_translation_table! :migrate_data => true
  end
end
