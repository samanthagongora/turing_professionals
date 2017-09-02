class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(user_id: @user.id)
      flash[:notice] = "Welcome, #{@user.username}"
    else
      flash[:notice] = "Username is taken; please choose a new one."
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :summary, :headline, :image_url, :first_name, :last_name, :linkedin_url)
  end
end
