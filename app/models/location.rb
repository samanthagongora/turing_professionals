class Location < ApplicationRecord
  validates_presence_of :city, :state

  has_many :office_locations
  has_many :companies, through: :office_locations

  has_many :user_locations
  has_many :users, through: :user_locations

  geocoded_by :full_address
  after_validation :geocode, if: :city_changed? && :state_changed?

  def full_address
    [city, state].compact.join(", ")
  end
end
