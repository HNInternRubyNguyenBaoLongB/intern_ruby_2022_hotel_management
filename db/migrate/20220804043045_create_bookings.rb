class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.decimal :total_price
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status
      t.string :reason
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
    add_index :bookings, [:user_id, :room_id, :bill_id]
  end
end
