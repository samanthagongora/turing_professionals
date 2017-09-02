class OauthController < ApplicationController

  def callback
    oauth = OauthService.new(request.env['omniauth.auth'], current_user)

    if current_user = oauth.create_oauth_information
      redirect_to dashboard_path
    else
      Rails.logger.info(current_user.errors.messages.inspect)
      flash[:alert] = "There was an error"
      redirect_to root_path
    end
  end

  def failure
   flash[:alert] = "There was an error while trying to authenticate your account."
   redirect_to register_path
  end


end
