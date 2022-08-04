class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.decimal :discount_rate
      t.integer :quantity
      t.decimal :condition
      t.datetime :expired_at

      t.timestamps
    end
  end
end
