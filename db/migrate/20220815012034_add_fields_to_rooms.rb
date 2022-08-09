class AddFieldsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :types, :integer
  end
end
