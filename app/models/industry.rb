class Industry < ApplicationRecord
  validates_presence_of :name

  has_many :company_industries
  has_many :companies, through: :company_industries
end
