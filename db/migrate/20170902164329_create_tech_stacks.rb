class CreateTechStacks < ActiveRecord::Migration[5.1]
  def change
    create_table :tech_stacks do |t|
      t.references :company, foreign_key: true
      t.references :technology, foreign_key: true

      t.timestamps
    end
  end
end
