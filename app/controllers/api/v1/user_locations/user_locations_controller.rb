class Api::V1::UserLocations::UserLocationsController < ApplicationController

  def index
    render json: UserLocation.everywhere
  end

end
