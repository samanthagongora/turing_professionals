class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username


  before_validation :set_program_type

  has_many :workplaces
  has_many :companies, through: :workplaces

  enum role: ["default", "admin"]
  enum status: ["active", "inactive"]
  enum program_type: ["backend", "frontend"]

  has_many :user_technologies
  has_many :technologies, through: :user_technologies

  has_many :user_locations
  has_many :locations, through: :user_locations

  accepts_nested_attributes_for :locations,
  reject_if: lambda {|attributes| attributes['city'].blank? && attributes['state'].blank?}

  has_many :favorites
  has_many :favorite_companies, through: :favorites, source: :favoritable, source_type: 'Company'

  has_many :favorite_users, through: :favorites, source: :favoritable, source_type: 'User'
  has_many :favorited_by, through: :favorites, source: :user

  mount_uploader :image_url, ImageUploader
  mount_uploader :resume, ResumeUploader


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

  has_many :messages
  NAME_REGEX = /\w+/

  def self.filter(params)
      User.select("users.*")
          .joins(user_locations: :location)
          .joins(workplaces: :company)
          .where("locations.id": params[:location_ids])
          .where("companies.id": params[:company_ids]).distinct
  end


  private

  def set_program_type
    return nil if self.cohort.nil?
    self.program_type = 0 if self.cohort.include?("B")
    self.program_type = 1 if self.cohort.include?("F")
  end
end
