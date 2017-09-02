class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true
  belongs_to :user, inverse_of: :favorites
end
