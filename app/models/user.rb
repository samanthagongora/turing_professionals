class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password
  validates_uniqueness_of :username
<<<<<<< HEAD

  belongs_to :location
  has_many :workplaces
=======
  
  enum role: ["default", "admin"]
  
  belongs_to :location, optional: true 
  has_many :favorites
  has_many :favorite_companies, through: :favorites, source: :favoritable, source_type: 'Company'
  #returns the favoritable object
  has_many :favorite_users, through: :favorites, source: :favoritable, source_type: 'User'
  #returns the user objects
  has_many :favorited_by, through: :favorites, source: :user

  mount_uploader :image_url, ImageUploader
  mount_uploader :resume, AttachmentUploader
>>>>>>> master
end
