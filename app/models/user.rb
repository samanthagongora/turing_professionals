class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username

  enum role: ["default", "admin"]
  enum status: ["active", "inactive"]

  has_many :user_locations
  has_many :locations, through: :user_locations

  accepts_nested_attributes_for :locations,
  reject_if: lambda {|attributes| attributes['city'].blank? && attributes['state'].blank?}

  has_many :workplaces

  has_many :favorites
  has_many :favorite_companies, through: :favorites, source: :favoritable, source_type: 'Company'

  has_many :favorite_users, through: :favorites, source: :favoritable, source_type: 'User'
  has_many :favorited_by, through: :favorites, source: :user

  mount_uploader :image_url, ImageUploader
  mount_uploader :resume, ResumeUploader

end
