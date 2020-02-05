class ItemsController < ApplicationController
  def new
  end
  
  def show
    @item = Item.find_by(id: params[:id])
    @images = Image.where(item_id: @item.id)
    @brand = Brand.find_by(id: @item.brand_id)
    @user = User.find_by(id: @item.user_id)
    @grandchildren = Category.find_by(id: @item.category_id)
    @children = @grandchildren.parent
    @parent = @children.parent  
  end

  def confirm
    @item=Item.new
  end  

end
