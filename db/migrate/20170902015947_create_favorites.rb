class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :favoritable, polymorphic: true, index: true
      t.string :favoritable_type

      t.timestamps
    end
  end
end
