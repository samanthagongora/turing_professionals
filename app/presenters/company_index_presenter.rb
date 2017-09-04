class CompanyIndexPresenter
  def initialize(params = {})
    @filter_params = params[:filter]
    @order = (params[:order] if params[:order]) || "ASC"
  end

  def companies
    companies = (Company.filter(@filter_params) if @filter_params) || Company.all
    companies.order("name #{@order}")
  end

  def switch_order
    return 'DESC' if @order == 'ASC'
    return 'ASC' if @order == 'DESC'
  end

  def locations
    Location.all
  end

  def industries
    Industry.all
  end
end
