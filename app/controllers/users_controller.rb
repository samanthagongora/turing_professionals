class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:notice] = "Username doth taken or passwordeth no valid, please retryith"
      render :new
    end
  end

  def show
    @user = current_user
    redirect_to login_path unless current_user
    render file: "/public/404" if current_admin?
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:notice] = "Thine information has been updated!"
      redirect_to dashboard_path if current_user.default?
      redirect_to admin_dashboard_path if current_user.admin?
    else
      flash[:notice] = "Please enter thine information correctly."
      render :edit
    end
  end

  def destroy
    user = current_user
    user.destroy
    session.clear
    flash[:notice] = "Account destroyed, my lord."
    redirect_to root_path
  end
end
