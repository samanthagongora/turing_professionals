class CreateWorkplaces < ActiveRecord::Migration[5.1]
  def change
    create_table :workplaces do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :position
      t.integer :status

      t.timestamps
    end
  end
end
