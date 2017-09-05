class MemberIndexPresenter
  attr_reader :order

  def initialize(params = {})
    @filter_params = params[:filter]
    @order = (params[:order] if params[:order]) || "ASC"
  end

  def users
    users = (User.filter(@filter_params) if @filter_params) || User.default.active
    users.order("last_name #{@order}")
  end

  def switch_order
    return 'DESC' if @order == 'ASC'
    return 'ASC' if @order == 'DESC'
  end

  def locations
    Location.all
  end

  def companies
    Company.all
  end
end
