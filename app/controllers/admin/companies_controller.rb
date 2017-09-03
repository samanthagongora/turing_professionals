class Admin::CompaniesController < Admin::BaseController

  def destroy
    company = Company.find(params[:id])
    company.destroy
    redirect_to admin_dashboard_path
  end

end
