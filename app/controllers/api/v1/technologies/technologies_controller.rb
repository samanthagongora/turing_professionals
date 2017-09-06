class API::V1::Technologies::TechnologiesController < ApplicationController
  def index
    render json: Technology.find(params[:id])
  end

end
