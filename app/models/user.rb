class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :workplaces
  has_many :companies, through: :workplaces

  enum role: ["default", "admin"]
  enum status: ["active", "inactive"]

  has_many :user_locations
  has_many :locations, through: :user_locations

  accepts_nested_attributes_for :locations,
  reject_if: lambda {|attributes| attributes['city'].blank? && attributes['state'].blank?}
  #allows for nested form for user to edit their profile

  # belongs_to :location, optional: true
  #### Does a user need to belong to a location. Can we have a many through relationship instead?

  has_many :favorites
  has_many :favorite_companies, through: :favorites, source: :favoritable, source_type: 'Company'
  #returns the favoritable object
  has_many :favorite_users, through: :favorites, source: :favoritable, source_type: 'User'
  #returns the user objects
  has_many :favorited_by, through: :favorites, source: :user

  mount_uploader :image_url, ImageUploader
  mount_uploader :resume, ResumeUploader
end
