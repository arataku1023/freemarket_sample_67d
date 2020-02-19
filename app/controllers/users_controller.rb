class UsersController < ApplicationController

  def index
  end

  def show
    @exhibited_items_count = Item.where(user_id: current_user.id).count
    @purchased_items_count = Item.where(buyer_id: current_user.id).count
    @favorites = Favorite.where(user_id: current_user.id)
  end
  
  def edit
  end

  def update
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def logout
  end

end
