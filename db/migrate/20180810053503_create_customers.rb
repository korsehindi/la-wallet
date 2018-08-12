class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :login
      t.text :name
      t.string :url
      t.string :avatar_url
      t.string :provider
      t.string :email
      t.text :location

      t.timestamps
    end
  end
end
