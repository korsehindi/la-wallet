class ChangeDataTypesInCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :title, :text
    change_column :customers, :gender, :text
    change_column :customers, :country, :text
  end
end
