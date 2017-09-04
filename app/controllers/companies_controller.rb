class CompaniesController < ApplicationController
  def index
    @company_index_presentor = CompanyIndexPresenter.new
  end

  def show
    @company = Company.find_by(slug: params[:company])
  end
end
