class AddStatusToBills < ActiveRecord::Migration[6.1]
  def change
    add_column :bills, :status, :integer, default: 0
  end
end
