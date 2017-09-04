class FilterCompaniesController < ApplicationController
  def index
    @company_index_presenter = CompanyIndexPresenter.new({filter: filter_params})
    render "companies/index"
  end

  private

  def filter_params
    params.permit(:location_id, :industry_id)
  end
end
