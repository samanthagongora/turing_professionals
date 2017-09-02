class ChangeUserLocationColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :location, :location_id
  end
end
