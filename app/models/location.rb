class Location < ApplicationRecord
  validates_presence_of :city, :state

  has_many :office_locations
  has_many :companies, through: :office_locations
end
