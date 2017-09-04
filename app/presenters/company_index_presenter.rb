class CompanyIndexPresenter
  def initialize(filter_params = nil)
    @filter_params = filter_params
  end

  def companies
    (Company.filter(@filter_params) if @filter_params) || Company.all
  end

  def locations
    Location.all
  end

  def industries
    Industry.all
  end
end
