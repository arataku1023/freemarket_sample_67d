class UsersController < ApplicationController

  def index
  end

  def show
    @user=User.find(current_user.id)
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
