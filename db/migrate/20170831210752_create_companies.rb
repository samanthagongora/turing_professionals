class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :image_url
      t.string :website

      t.timestamps
    end
  end
end
