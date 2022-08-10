class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :room_id
      t.string :photo

      t.timestamps
    end
  end
end
