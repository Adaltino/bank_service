class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.integer :transaction_type
      t.decimal :amount
      t.string :description

      t.timestamps
    end
  end
end
