class OauthController < ApplicationController

  def callback
    oauth = OauthService.new(request.env['omniauth.auth'], current_user)

     if current_user = oauth.create_oauth_information
      redirect_to user_path(session[:user_id])
    else
      flash[:alert] = "There was an error"
      redirect_to root_path
    end

  end

end
