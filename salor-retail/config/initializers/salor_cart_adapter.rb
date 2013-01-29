ADAPTER_ORDER = SalorRetail::Order
ADAPTER_PRODUCT = SalorRetail::Item
ADAPTER_ITEM = SalorRetail::OrderItem
ADAPTER_BUYER = SalorRetail::Customer
ADAPTER_CATEGORY = SalorRetail::Category
ADAPTER_USER = SalorRetail::User

ADAPTER_FOREIGNKEY_BUYER = 'customer_id'


# module ActiveRecord
#   module Associations
#     module ClassMethods
#       def belongs_to(name, options = {})
#         adaptername = "ADAPTER_#{name.to_s.upcase}"
#         puts adaptername
#         begin
#           constant = adaptername.constantize
#         rescue
#           constant = nil
#         end
#         
#         if not constant.nil?
#           puts "defined: #{ adaptername.constantize.inspect } #{ defined?(adaptername.constantize)}"
#           foreign_key =  adaptername.constantize.table_name.singularize + "_id"
#           puts "XXX #{ foreign_key }"
#           options = {:foreign_key => foreign_key}
#         end
#         
#         Builder::BelongsTo.build(self, name, options)
#       end
#     end
#   end
# end