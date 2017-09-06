class Api::V1::Technologies::TechnologiesController < ApplicationController

  def index
    render json: Technology.most_popular
  end

end
