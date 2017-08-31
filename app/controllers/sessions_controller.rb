class SessionsController < ApplicationController
  def create
      @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
      if @user
        session[:user_id] = @user.id
        redirect_to dashboard_path
      else
        flash[:error] = "Please create a Census account through Turing School."
        redirect_to root_path
      end
    end
end
