class AddedDatabaseValidationForCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :login, :string, null:false
    change_column :customers, :name, :text, null:false
    change_column :customers, :url, :string, null:false
    change_column :customers, :avatar_url, :string, null:false
    change_column :customers, :provider, :string, null:false
    change_column :customers, :slug, :string, null:false
  end
end
