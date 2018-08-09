class AddPasswordDigestToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :password_digest, :string
  end
end
