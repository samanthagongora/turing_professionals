class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :markdown_to_html
  helper_method :authorize
  include SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_default
    render "public/404" unless current_user.default?
  end

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end

end
