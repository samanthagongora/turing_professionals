class Admin::DashboardController < Admin::BaseController

  def show
    @users = User.default
    @companies = Company.all
  end

end
