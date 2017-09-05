class DashboardController < ApplicationController
  before_action :require_default

  def show
    @favorited_companies = current_user.favorite_companies
    @favorite_members = current_user.favorite_users
  end
end
