class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin"]

  # belongs_to :location

  # validates_presence_of :auth_token_linkedin,
  #                       :uid,
  #                       :first_name,
  #                       :last_name,
  #                       :email,
  #                       :summary,
  #                       :linkedin_url,
  #                       :image_url,
  #                       :slack,
  #                       :github,
  #                       :cohort

  # validates_uniqueness_of :auth_token_linkedin,
  #                         :uid,
  #                         :email,
  #                         :linkedin_url,
  #                         :twitter,
  #                         :slack,
  #                         :github


  # def self.find_or_create_by_auth(auth)
    # user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])
    # census_data = CensusService.find_user(auth['first_name'], auth['last_name'])
    #
    # return nil if census_data.nil?
    #
    # user.role = 0
    # user.auth_token_linkedin = auth['access_token']
    # user.uid = auth['info']['name']
    # user.first_name = auth['info']['email']
    # user.last_name = auth['uid']
    # user.email = auth['info']['nickname']
    # user.tagline = auth['info']['image']
    # user.summary = auth['summary']
    # user.linkedin_url = auth['url']
    # user.image_url = auth['image']
    # user.resume = nil
    # user.location = nil
    #
    # user.twitter = census_data['twitter']
    # user.slack = census_data['slack']
    # user.github = census_data['github']
    # user.cohort = census_data['cohort']
    #
    # user.save
    # user
  # end
end
