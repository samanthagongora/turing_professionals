class InterviewQuestion < ApplicationRecord
  belongs_to :company

  validates_presence_of :description, :company_id
end
