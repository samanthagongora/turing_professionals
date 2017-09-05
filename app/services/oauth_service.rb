class OauthService

  def initialize(auth_hash, user)
    @user = user
    @auth_hash = auth_hash
  end

  def create_oauth_information
    @user.update_attributes!(oauth_account_params)
  end

  private
    def oauth_account_params
      { uid: @auth_hash[:uid],
        headline: @auth_hash[:info][:description],
        first_name: @auth_hash[:info][:first_name],
        last_name: @auth_hash[:info][:last_name],
        email: @auth_hash[:info][:email],
        linkedin_url: @auth_hash[:info][:urls][:public_profile],
        summary: @auth_hash[:extra][:raw_info][:industry],
        image_url: @auth_hash[:extra][:raw_info][:pictureUrl]
      }
    end

end
