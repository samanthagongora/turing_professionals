class OfficeLocation < ApplicationRecord
  validates_presence_of :location_id, :company_id

  belongs_to :location
  belongs_to :company
end
