class OauthService

  def initialize(auth_hash, user)
    @user = user
    @auth_hash = auth_hash
  end

  def create_oauth_information
    @user.update_attributes(oauth_account_params)
  end

  private
    def oauth_account_params
      { uid: @auth_hash[:uid],
        headline: @auth_hash[:info][:description],
        summary: @auth_hash[:extra][:raw_info][:industry]
      }
    end

end
