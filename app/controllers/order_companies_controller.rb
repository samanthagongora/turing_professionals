class OrderCompaniesController < ApplicationController
  def index
    @company_index_presentor = CompanyIndexPresenter.new({order: order_params[:direction]})
    render "companies/index"
  end

  private

  def order_params
    params.require(:order).permit(:direction)
  end
end
