class LocationsController < ApplicationController

  def index
    @locations = Location.where.not(latitude: nil, longitude: nil)
  end

end
