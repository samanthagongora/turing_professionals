class FavoriteUsersController < ApplicationController

  def create
    favoritable = User.find(favorite_users_params)
    favorite = Favorite.new(user: current_user, favoritable: favoritable)

    respond_to do |format|
      if favorite.save
        format.json { render json: favorite, status: :created }
      else
        format.json { render json: favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def favorite_users_params
    params.require(:favorite_user_id)
  end
end
