class SalorCartSynchronization < ActiveRecord::Migration
  def up
    
    schema = {
      "ADAPTER_CATEGORY" => {"name" => "string"
                             },
      'ADAPTER_PRODUCT' => {'unit_price_cents' => 'integer',
                            'unit_price_currency' => 'string',
                            'digital_content' => 'boolean',
                            'subscription' => 'boolean',
                            'digital_content_permissions' => 'text',
                            'subscription_type' => 'string',
                            'subscription_period' => 'string',
                            'subscription_subdomain_required' => 'boolean',
                            'subscription_start_date' => 'datetime',
                            'subscription_times' => 'integer',
                            'subscription_api_url' => 'string',
                            'subscription_api_params_subscribe' => 'text',
                            'subscription_api_params_unsubscribe' => 'text'
                           },
      "ADAPTER_ORDER"=> {"buyer_id" => "integer",
                         "google_order_number" => "string",
                         "total_cents" => 'integer',
                         'total_currency' => 'string',
                         'last_charged_amount_cents' => 'integer',
                         'last_charged_amount_currency' => 'string',
                         'last_authorized_amount_cents' => 'integer',
                         'last_authorized_amount_currency' => 'string',
                         'refund_amount_cents' => 'integer',
                         'refund_amount_currency' => 'string',
                         'unit_price_cents' => 'integer',
                         'unit_price_currency' => 'string'
                        },
      "ADAPTER_BUYER"=> {"id_hash" => "string",
                         'signup_activated' => 'boolean',
                         'signup_email' => 'string'
                        },
      "ADAPTER_USER" => {"id_hash" => "string"}
    }

    schema.keys.each do |constname|
      if defined?(constname.constantize)
        puts "Adapter #{ constname } is defined, merging columns! :)"
        
        tablename = constname.constantize.table_name #constname.gsub('ADAPTER_', '').tableize
        
        if not table_exists?(tablename)
          create_table tablename do |t|
            t.timestamps
          end
        else
          puts "Table #{ tablename } already exists"
        end
        
        schema[constname].keys.each do |columnname|
          if not column_exists?(tablename, columnname)
            add_column tablename, columnname, schema[constname][columnname]
          else
            puts "Column #{ columnname } in table #{ tablename } already exists."
          end
        end
      end
    end

  end

  def down
  end
end
