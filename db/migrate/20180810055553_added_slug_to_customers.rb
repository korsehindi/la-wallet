class AddedSlugToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :slug, :string
  end
end
