class TechStack < ApplicationRecord
  belongs_to :company
  has_many :company_industries, through: :company
  has_many :industries, through: :company_industries
  belongs_to :technology

  validates_presence_of :company_id, :technology_id
end
