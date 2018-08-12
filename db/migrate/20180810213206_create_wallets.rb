class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.string :address, null: false
      t.decimal :balance, null: false, default: 0.0
      t.text :alias, null: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
