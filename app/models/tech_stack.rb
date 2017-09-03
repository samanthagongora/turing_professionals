class TechStack < ApplicationRecord
  belongs_to :company
  belongs_to :technology

  validates_presence_of :company_id, :technology_id
end
