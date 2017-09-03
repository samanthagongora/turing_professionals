class AddSlugTwitterAndLinkedinColumnsToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :slug, :string
    add_column :companies, :twitter, :string
    add_column :companies, :linkedin_url, :string
  end
end
