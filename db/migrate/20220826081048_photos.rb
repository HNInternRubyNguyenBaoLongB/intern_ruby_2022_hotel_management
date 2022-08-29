class Photos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.integer :review_id
      t.string :name

      t.timestamps
    end
  end
end
