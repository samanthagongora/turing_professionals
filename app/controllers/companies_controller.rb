class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @cities = Location.all
    @industries = Industry.all
  end

  def show
    @company = Company.find_by(slug: params[:company])
  end
end
