class CategoriesController < ApplicationController
  def index
  end


  def show
    @category=Category.find(params[:id])
    @items = Item.where(buyer_id: nil).order(created_at: :desc)
    @images = Image.all
  end
  
end