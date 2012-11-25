class AddEmployeeToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :employee_id, :integer
  end
end
