class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.decimal :total_price
      t.references :user, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true

      t.timestamps
    end
    add_index :bills, [:user_id, :discount_id, :created_at]
  end
end
