class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  #has_many :favorite_companies, as: :favoritable

  enum role: ["default", "admin"]

  validates_presence_of :username, :password
  validates_uniqueness_of :username
end
