class FiltersController < ApplicationController
  def index
    @company_index_presentor = CompanyIndexPresenter.new(filter_params)
    render "companies/index"
  end

  private

  def filter_params
    params.permit(:location_id, :industry_id)
  end

end
