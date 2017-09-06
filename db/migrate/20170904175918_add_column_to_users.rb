class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :about_me, :string
    add_column :users, :interest, :string
    add_column :users, :working_on, :string
  end
end
