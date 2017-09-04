class FiltersController < ApplicationController
  def index
    @companies = Company.select("companies.*")
                        .joins(office_locations: :location)
                        .joins(company_industries: :industry)
                        .where("locations.id = ?", filter_params[:location_id])
                        .where("industries.id = ?", filter_params[:industry_id])

    @cities = Location.all
    @industries = Industry.all
    render "companies/index"

  end

  private

  def filter_params
    params.permit(:location_id, :industry_id)
  end

end
