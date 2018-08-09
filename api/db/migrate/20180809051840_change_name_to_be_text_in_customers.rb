class ChangeNameToBeTextInCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :name, :text
  end
end
