class CreateOfficeLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :office_locations do |t|
      t.references :location, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
