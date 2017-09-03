class Admin::UsersController < Admin::BaseController

  def update
    @user = User.find(params[:id])
    @user.update_attribute('status', params[:new_status])
    redirect_to admin_dashboard_path
  end

end
