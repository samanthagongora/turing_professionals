class Admin::DashboardController < Admin::BaseController

  def show
    @users = User.all
    @companies = Company.all
  end

end
