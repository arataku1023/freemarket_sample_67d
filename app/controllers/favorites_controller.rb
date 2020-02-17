class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: current_user.id, item_id: params[:item_id])
    @favorite.save
    redirect_to "/items/3"
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    @favorite.destroy
    redirect_to "/items/3"
  end
end
