class Favorite < ApplicationRecord
  validates_presence_of :user_id, :favoritable_type, :favoritable_id

  belongs_to :favoritable, polymorphic: true
  belongs_to :user, inverse_of: :favorites
# returns the favorite objects
  scope :users, -> { where(favoritable_type: 'User') }
  scope :companies, -> { where(favoritable_type: 'Company') }
end
