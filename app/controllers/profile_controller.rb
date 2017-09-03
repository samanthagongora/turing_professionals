class ProfileController < ApplicationController
  before_action :require_default

  def show
    @user = current_user
  end
end
