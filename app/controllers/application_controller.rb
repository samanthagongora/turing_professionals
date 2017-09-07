class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :markdown_to_html
  include SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_default
    render "public/404" unless current_user.default?
  end



end
