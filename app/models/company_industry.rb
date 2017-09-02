class CompanyIndustry < ApplicationRecord
  belongs_to :company
  belongs_to :industry

  validates_presence_of :company_id, :industry_id
end
