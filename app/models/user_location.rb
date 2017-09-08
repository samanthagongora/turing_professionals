class UserLocation < ApplicationRecord
  validates_presence_of :user_id, :location_id

  belongs_to :user
  belongs_to :location
end
