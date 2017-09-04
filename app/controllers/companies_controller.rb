class CompaniesController < ApplicationController
  def index
    @company_index_presenter = CompanyIndexPresenter.new
  end

  def show
    @company = Company.find_by(slug: params[:company])
  end
end
