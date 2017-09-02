class Favorite < ApplicationRecord
  validates_presence_of :user_id, :favoritable_type, :favoritable_id

  belongs_to :favoritable, polymorphic: true
  belongs_to :user, inverse_of: :favorites
end
