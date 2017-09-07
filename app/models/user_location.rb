class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location

  def self.everywhere
    select("location_name AS city, count(user_locations.location_id) AS count")
    .joins(:location)
    .group("locations.city")
    .count(:location_id)
  end
end
