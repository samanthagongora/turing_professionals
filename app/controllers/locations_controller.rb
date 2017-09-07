class LocationsController < ApplicationController
  before_action :authorize

  def index
    @locations = Location.all
  end

end
