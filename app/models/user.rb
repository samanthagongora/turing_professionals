class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username

  enum role: ["default", "admin"]

  belongs_to :location, optional: true
  has_many :favorites
  has_many :favorite_companies, through: :favorites, source: :favoritable, source_type: 'Company'
  #returns the favoritable object
  has_many :favorite_users, through: :favorites, source: :favoritable, source_type: 'User'
  #returns the user objects
  has_many :favorited_by, through: :favorites, source: :user

  # mount_uploader :image_url, ImageUploader
  mount_uploader :resume, AttachmentUploader

  enum status: ["active", "inactive"]

  scope :default, -> {where(role: "default")}
  scope :active, -> {where(status: "active")}
  scope :inactive, -> {where(status: "inactive")}

  validate :current_password_is_correct, on: :update
  attr_accessor :current_password

  def current_password_is_correct
    # Check if the user tried changing his/her password
    if !password.blank?
      # Get a reference to the user since the "authenticate" method always returns false when calling on itself (for some reason)
      user = User.find_by_id(id)
      # Check if the user CANNOT be authenticated with the entered current password
      if (user.authenticate(current_password) == false)
        # Add an error stating that the current password is incorrect
        errors.add(:current_password, "is incorrect.")
      end
    end
  end
end
