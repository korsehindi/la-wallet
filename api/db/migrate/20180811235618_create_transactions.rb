class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount, null: false
      t.datetime :date, null: false
      t.text :message, null: true
      t.belongs_to :sender_wallet, index: true
      t.belongs_to :recipient_wallet, index: true

      t.timestamps
    end
  end
end
