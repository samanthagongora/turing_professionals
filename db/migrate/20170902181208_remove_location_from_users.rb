class RemoveLocationFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :location
  end
end
