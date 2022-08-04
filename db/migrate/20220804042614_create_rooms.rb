class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :status
      t.decimal :rate_avg

      t.timestamps
    end
  end
end
