class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    @users = User.default.active
  end

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
      flash[:notice] = @user.errors.messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile successfully updated!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Sorry! There was an error updating your profile information. Please try again."
      redirect_to user_path(@user)
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :summary, :headline, :image_url, :first_name, :last_name, :linkedin_url, :email, :headline, :summary, :twitter, :slack, :github, :resume)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
