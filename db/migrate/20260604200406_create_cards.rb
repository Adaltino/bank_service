class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.references :account, null: false, foreign_key: true
      t.string :number
      t.string :cvv
      t.string :expiration_date
      t.decimal :limit
      t.decimal :available_limit
      t.integer :status

      t.timestamps
    end
  end
end
