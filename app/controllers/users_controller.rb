class UsersController < ApplicationController

  def index
  end

  def show
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
