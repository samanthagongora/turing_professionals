class Company < ApplicationRecord
  validates_presence_of :name, :website

  has_many :company_industries
  has_many :industries, through: :company_industries
end
