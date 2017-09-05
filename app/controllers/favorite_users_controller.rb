class FavoriteUsersController < ApplicationController

  def create
    favoritable = User.find(favorite_user_params)
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
    favoritable = User.find(favorite_user_params)
    favorite = Favorite.where(user: current_user, favoritable: favoritable)

    respond_to do |format|
      if favorite.destroy_all
        format.json { render json: favorite, status: :no_content }
      else
        format.json { render json: favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def favorite_user_params
    params.require(:favorite_user_id)
  end
end
