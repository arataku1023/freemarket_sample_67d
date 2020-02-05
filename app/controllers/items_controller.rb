class ItemsController < ApplicationController
  def new
   @item = Item.new
  end

  def create
   Item.create(item_params)
  end
  
  def show
    @item = Item.find(id: params[:id])
    @images = Image.where(item_id: @item.id)
    @brand = Brand.find(id: @item.brand_id)
    @user = User.find(id: @item.user_id)
    @grandchildren = Category.find(id: @item.category_id)
    @children = @grandchildren.parent
    @parent = @children.parent  
  end

  def confirm
    @item=Item.new
  end  

  # private
  # def item_params   #後でmerge内を追加...brand_id etc.
  #   params.require(:item).permit(:detail, :price, :status, :region, :arrival_date, :mail, :mail_way).merge(user_id: current_user.id, category_id:) 
  # end
end
