class Location < ApplicationRecord
  validates_presence_of :city, :state

  scope :with_lat_lng, -> { where.not(latitude: nil, longitude: nil) }

  has_many :office_locations
  has_many :companies, through: :office_locations

  has_many :user_locations
  has_many :users, through: :user_locations

  geocoded_by :full_address
  after_validation :geocode, if: :city_changed? && :state_changed?

  def full_address
    [city, state].compact.join(", ")
  end

  def self.recent_location(user)
    user.locations.order(updated_at: :desc)
    .where.not(latitude: nil, longitude: nil).first
  end

  def self.recent_lat_and_long(user)
    user.locations.order(updated_at: :desc)
    .where.not(latitude: nil, longitude: nil)
    .pluck(:latitude, :longitude).first
  end
end
