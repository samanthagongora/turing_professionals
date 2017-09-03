class Admin::BaseController < ApplicationController
  before_action :require_current_admin

  def require_current_admin
    render file: "public/404" unless current_user.admin?
  end

end
