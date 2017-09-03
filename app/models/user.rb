class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :favorite_companies, through: :favorites, source: :favoritable, source_type: 'Company'
  #returns the favoritable object
  has_many :favorite_users, through: :favorites, source: :favoritable, source_type: 'User'
  #returns the user objects
  has_many :favorited_by, through: :favorites, source: :user

  enum role: ["default", "admin"]
  validates_presence_of :username, :password
end
