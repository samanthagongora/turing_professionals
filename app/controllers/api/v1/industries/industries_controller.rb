class Api::V1::Industries::IndustriesController < ApplicationController

  def show
    render json: Technology.by_industry_and_company(params[:name])
  end

end
