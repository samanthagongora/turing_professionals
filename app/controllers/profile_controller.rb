class ProfileController < ApplicationController
  before_action :require_default

  def show
    @locations = Location.all
    @companies = Company.all
  end
end
