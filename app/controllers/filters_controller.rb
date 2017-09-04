class FiltersController < ApplicationController
  def index
    @companies = Company.filter(filter_params)

    @cities = Location.all
    @industries = Industry.all
    render "companies/index"
  end

  private

  def filter_params
    params.permit(:location_id, :industry_id)
  end

end
