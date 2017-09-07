class AddProgramTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :program_type, :integer
  end
end
