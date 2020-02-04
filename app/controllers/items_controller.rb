class ItemsController < ApplicationController
  def new
   @item = Item.new
  end

  def create
   Item.create(item_params)
  end
  
  def show
  end

  def confirm
    @item=Item.new
  end  

  # private
  # def item_params   #後でmerge内を追加...brand_id etc.
  #   params.require(:item).permit(:detail, :price, :status, :region, :arrival_date, :mail, :mail_way).merge(user_id: current_user.id, category_id:) 
  # end
end
