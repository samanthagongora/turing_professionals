class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
      t.string :auth_token_linkedin, default: nil
      t.integer :uid, default: 0
      t.string :first_name, default: nil
      t.string :last_name, default: nil
      t.string :email, default: nil
      t.string :headline, default: nil
      t.text :summary, default: nil
      t.string :linkedin_url, default: nil
      t.text :image_url, default: nil
      t.string :resume, default: nil
      t.integer :location, default: 0
      t.string :twitter, default: nil
      t.string :slack, default: nil
      t.string :github, default: nil
      t.string :cohort, default: nil

      t.timestamps
    end
  end
end
