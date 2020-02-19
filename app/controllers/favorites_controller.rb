class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: current_user.id, item_id: params[:item_id])
    if @favorite.save
      redirect_to "/items/#{params[:item_id]}"
    else 
      redirect_to root_path
    end   
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    if @favorite.destroy
      redirect_to "/items/#{params[:item_id]}"
    else
      redirect_to root_path
    end  
  end
end
