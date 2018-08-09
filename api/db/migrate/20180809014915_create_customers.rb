class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :title
      t.string :gender
      t.integer :age
      t.string :country
      t.string :email
      t.string :slug

      t.timestamps
    end
  end
end
